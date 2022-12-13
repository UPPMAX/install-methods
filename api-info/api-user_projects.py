#!/sw/apps/pm-tools/latest/rackham/venv/rich/bin/python3
#!/usr/bin/env python3
import argparse
from os import environ as env
from  urllib import request
import json

from rich.console import Console
from rich.table import Table

global DEBUG
def debug(msg):
  if DEBUG:
    print(f"DEBUG: {msg}")

# Command line options ====================================================
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", help="Ask for help",
                    action="help")
parser.add_argument("-d", "--debug", help="Include debug output",
                    action="store_true")
parser.add_argument("-u", "--user", default=env.get("USER"))

args= parser.parse_args()
DEBUG = args.debug
debug(args)
userid= args.user

# Read projects info ======================================================
API="api.uppmax.uu.se:5000/api/v1"
FILTER="Allocations.Type=storage"
FIELDS="Allocations,Projectname,Directory_Name,Status,Uppmax_Members"
with request.urlopen("http://"+API+"/projects?fields="+FIELDS+"&machineparser=1") as url:
  projects = json.load(url)

# Active project 
user_projects= [key for key, item in projects.items() if userid in [uid["Username"] for uid in item["Uppmax_Members"]] and item["Status"]=="Active" ]
debug(user_projects)
proj_loop= [user_projects]

# Other than Ative projects
user_projects= [key for key, item in projects.items() if userid in [uid["Username"] for uid in item["Uppmax_Members"]] and item["Status"]!="Active" ]
debug(user_projects)
proj_loop.append(user_projects)

# Table definition ========================================================
table = Table(title="User_ID: "+userid)

table.add_column("Project")
table.add_column("Resource")
table.add_column("Type")
table.add_column("Value",justify="right")
table.add_column("Status")
table.add_column("End")

# Loop first over Active and then over other projects =====================
for ip in proj_loop:
  for i in ip:
    resources= [res["Resource"] for res in projects[i]["Allocations"]]
    debug(i);  debug(resources)

    for j, _resource in enumerate(resources):
  
      RES= projects[i]["Allocations"][j]["Resource"]
      TYPE= projects[i]["Allocations"][j]["Type"]
      STATUS= projects[i]["Status"]
      VALUE=projects[i]["Allocations"][j]["Value"]
      END= projects[i]["Allocations"][j]["End"]
      
      if STATUS=="Active": STATUS= "[bold][green]"+STATUS
      if STATUS=="Locked": STATUS= "[bold][red]"+STATUS
      if STATUS=="Expired": STATUS= "[bold][yellow]"+STATUS
      
      if TYPE=="core": TYPE= "[bold][green]"+TYPE
      if TYPE=="storage": TYPE= "[bold][blue]"+TYPE
  
      table.add_row(i if j==0 else "" , RES, TYPE, f'{VALUE:_}' ,STATUS, END )
  
    table.add_section()

console = Console()
console.print(table)

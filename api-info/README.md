Enviroment for `/sw/apps/pm-tools/latest/rackham/venv/rich`

## Create env
```bash
module load python/3.9.5
python3 -m pip venv /sw/apps/pm-tools/latest/rackham/venv/rich
source /sw/apps/pm-tools/latest/rackham/venv/rich/bin/activate
python3 -m pip install reqirements.txt
```


## Examples
```bash
/crex/proj/staff/api-user_projects.py -u ulfha881
                            User_ID: ulfha881                             
┏━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━┳━━━━━━━━┳━━━━━━━━┳━━━━━━━━━━━━┓
┃ Project     ┃ Resource        ┃ Type    ┃  Value ┃ Status ┃ End        ┃
┡━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━╇━━━━━━━━╇━━━━━━━━╇━━━━━━━━━━━━┩
│ sens2018587 │ castor_backup   │ storage │ 10_000 │ Active │ 2021-09-17 │
│             │ castor_backup   │ storage │  2_600 │ Active │ 2023-10-01 │
│             │ castor_nobackup │ storage │  2_000 │ Active │ 2018-09-14 │
│             │ castor_nobackup │ storage │  3_000 │ Active │ 2021-09-17 │
│             │ castor_nobackup │ storage │    400 │ Active │ 2023-10-01 │
│             │ bianca          │ core    │  1_000 │ Active │ 2023-10-01 │
├─────────────┼─────────────────┼─────────┼────────┼────────┼────────────┤
│ sens2020559 │ castor_backup   │ storage │  1_000 │ Active │ 2021-08-25 │
│             │ castor_backup   │ storage │    160 │ Active │ 2023-09-01 │
│             │ castor_nobackup │ storage │    500 │ Active │ 2021-08-25 │
│             │ castor_nobackup │ storage │     40 │ Active │ 2023-09-01 │
│             │ bianca          │ core    │  4_000 │ Active │ 2023-09-01 │
├─────────────┼─────────────────┼─────────┼────────┼────────┼────────────┤
│ sens2019512 │ castor_backup   │ storage │    128 │ Active │ 2019-12-19 │
```

```json
/crex/proj/staff/api-user_info.sh xxxxxxx
{
  "Username": "xxxxxxxx",
  "Status": "Open",
  "Expires": "2024-01-01",
  "Name": "xxxxx xxxxxxxx",
  "Created": "2019-02-28",
  "Suprid": xxxxxxx,
  "Federated": "xxxxxx@user.uu.se",
  "Affiliation": "Uppsala universitet",
  "Gid": xxxxxxxxx,
  "Cua": "Yes",
  "Mail": "xxxxxxxxxr@medsci.uu.se",
  "Uid": xxxxxxx
}
```

```json
/crex/proj/staff/api-project_info.sh snic2017-7-xxx
{
  "Category": "uppmax",
  "Deputy": {
    "Mail": "xxxxxxx@lnu.se",
    "Suprid": xxxxxx,
    "Name": "xxxx xxxxxx"
  },
  "End": "2022-04-01",
  "Title": "xxxxxx xxxxxx 2",
  "Lock_at": "2022-07-01",
  "Projectname": "snic2017-7-xxx",
  "Supr_Proj_id": xxxx,
  "Start": "2017-12-28",
  "Gid": xxxxxx,
  "Directory_Name_Type": "default",
  "Allocations": [
    {
      "Start": "2017-12-28",

```

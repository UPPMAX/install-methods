# vim-8.0-16-install-README.md

vim/8.0-16
============

<http://www.vim.org/download.php#unix>

LOG
---

Unless you know the version (includes patch level), then build, find out, and rebuild.

    VERSION=V
    CLUSTER=${CLUSTER?:CLUSTER must be nonempty}
    cd /sw/apps
    mkdir vim
    cd vim
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    module load git/2.5.0
    git clone https://github.com/vim/vim.git
    cd vim
    module load gcc/5.3.0
    cd src
    make -j 8
    ./vim --version

Observe output, determine version and patch level.

    VERSION_TMP=$VERSION
    VERSION=8.0-16

Remove temp version directory.

    cd ../../../../
    mv $VERSION_TMP $VERSION
    unset VERSION_TMP
    cd $VERSION
    cd $CLUSTER
    PREFIX=$PWD
    cd ..
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    rm -rf vim
    git clone https://github.com/vim/vim.git
    cd vim

Include multibyte support.

    ./configure --with-features=big --prefix=$PREFIX
    make -j 8
    make -j 8 install

Repeat on tintin, but don't use `-j 8`.


The output of the `./vim --version` above:

<pre>
milou-b: /sw/apps/vim/V/src_milou/vim/src $     ./vim --version
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Sep 27 2016 11:19:31)
Included patches: 1-16
Compiled by douglas@milou-b.uppmax.uu.se
Huge version with GTK2 GUI.  Features included (+) or not (-):
+acl             +file_in_path    +mouse_sgr       +tag_old_static
+arabic          +find_in_path    -mouse_sysmouse  -tag_any_white
+autocmd         +float           +mouse_urxvt     -tcl
+balloon_eval    +folding         +mouse_xterm     +termguicolors
+browse          -footer          +multi_byte      +terminfo
++builtin_terms  +fork()          +multi_lang      +termresponse
+byte_offset     +gettext         -mzscheme        +textobjects
+channel         -hangul_input    +netbeans_intg   +timers
+cindent         +iconv           +num64           +title
+clientserver    +insert_expand   +packages        +toolbar
+clipboard       +job             +path_extra      +user_commands
+cmdline_compl   +jumplist        -perl            +vertsplit
+cmdline_hist    +keymap          +persistent_undo +virtualedit
+cmdline_info    +lambda          +postscript      +visual
+comments        +langmap         +printer         +visualextra
+conceal         +libcall         +profile         +viminfo
+cryptv          +linebreak       -python          +vreplace
+cscope          +lispindent      -python3         +wildignore
+cursorbind      +listcmds        +quickfix        +wildmenu
+cursorshape     +localmap        +reltime         +windows
+dialog_con_gui  -lua             +rightleft       +writebackup
+diff            +menu            -ruby            +X11
+digraphs        +mksession       +scrollbind      -xfontset
+dnd             +modify_fname    +signs           +xim
-ebcdic          +mouse           +smartindent     +xpm
+emacs_tags      +mouseshape      +startuptime     +xsmp_interact
+eval            +mouse_dec       +statusline      +xterm_clipboard
+ex_extra        -mouse_gpm       -sun_workshop    -xterm_save
+extra_search    -mouse_jsbterm   +syntax
+farsi           +mouse_netterm   +tag_binary
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
  system gvimrc file: "$VIM/gvimrc"
    user gvimrc file: "$HOME/.gvimrc"
2nd user gvimrc file: "~/.vim/gvimrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
    system menu file: "$VIMRUNTIME/menu.vim"
  fall-back for $VIM: "/usr/local/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12     -O2 -fno-strength-reduce -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc   -L/usr/local/lib -Wl,--as-needed -o vim   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -lSM -lICE -lXpm -lXt -lX11 -lXdmcp -lSM -lICE  -lm -ltinfo -lelf -lnsl  -lselinux -lacl -lattr
<pre>

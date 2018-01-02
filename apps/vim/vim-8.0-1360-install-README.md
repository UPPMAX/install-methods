vim/8.0-1360
============

<http://www.vim.org/download.php#unix>

LOG
---

    TOOL=/sw/apps/vim
    CLUSTER=${CLUSTER?:CLUSTER must be nonempty}
    mkdir -p $TOOL
    cd $TOOL
    module load gcc/6.2.0
    module load git/2.10.2

Unless you know the version (includes patch level), then build, find out, and rebuild.

    VERSION_TMP=V
    mkdir $VERSION_TMP
    cd $VERSION_TMP
    git clone https://github.com/vim/vim.git
    cd vim
    cd src
    make -j 8
    ./vim --version

Observe output, determine version and highest patch level.

    VERSION=8.0-1360
    cd $TOOL
    rm -rf $VERSION_TMP

Remove temp version directory.

    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src
    [[ -d vim ]] || git clone https://github.com/vim/vim.git
    cd vim

Include huge list of features, including interpreters.  Do not load `perl/5.24.1` because of a symbol collision with `libieee`... ?

    module load python/2.7.11 
    module load python3/3.6.0
    module load ruby/2.4.1

    make distclean
    ./configure --with-features=huge --enable-fail-if-missing --enable-pythoninterp --with-python-config-dir=/sw/comp/python/2.7.11_$CLUSTER/lib/python2.7/config --enable-python3interp --with-python3-config-dir=/sw/comp/python/3.6.0_$CLUSTER/lib/python3.6/config-3.6m-x86_64-linux-gnu --enable-perlinterp --enable-tclinterp --enable-rubyinterp --prefix=$PREFIX

    make -j 8
    make install



The output of the `./vim --version` for the built version is:

<pre>
milou-b: /sw/apps/vim/8.0-1360/milou/bin $ ./vim --version
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Dec  1 2017 16:13:12)
Included patches: 1-1360
Compiled by douglas@milou-b.uppmax.uu.se
Huge version with GTK2 GUI.  Features included (+) or not (-):
+acl               +farsi             +mouse_sgr         -tag_any_white
+arabic            +file_in_path      -mouse_sysmouse    +tcl
+autocmd           +find_in_path      +mouse_urxvt       +termguicolors
-autoservername    +float             +mouse_xterm       +terminal
+balloon_eval      +folding           +multi_byte        +terminfo
+balloon_eval_term -footer            +multi_lang        +termresponse
+browse            +fork()            -mzscheme          +textobjects
++builtin_terms    +gettext           +netbeans_intg     +timers
+byte_offset       -hangul_input      +num64             +title
+channel           +iconv             +packages          +toolbar
+cindent           +insert_expand     +path_extra        +user_commands
+clientserver      +job               +perl              +vertsplit
+clipboard         +jumplist          +persistent_undo   +virtualedit
+cmdline_compl     +keymap            +postscript        +visual
+cmdline_hist      +lambda            +printer           +visualextra
+cmdline_info      +langmap           +profile           +viminfo
+comments          +libcall           +python/dyn        +vreplace
+conceal           +linebreak         +python3/dyn       +wildignore
+cryptv            +lispindent        +quickfix          +wildmenu
+cscope            +listcmds          +reltime           +windows
+cursorbind        +localmap          +rightleft         +writebackup
+cursorshape       -lua               +ruby              +X11
+dialog_con_gui    +menu              +scrollbind        -xfontset
+diff              +mksession         +signs             +xim
+digraphs          +modify_fname      +smartindent       +xpm
+dnd               +mouse             +startuptime       +xsmp_interact
-ebcdic            +mouseshape        +statusline        +xterm_clipboard
+emacs_tags        +mouse_dec         -sun_workshop      -xterm_save
+eval              -mouse_gpm         +syntax
+ex_extra          -mouse_jsbterm     +tag_binary
+extra_search      +mouse_netterm     +tag_old_static
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
  system gvimrc file: "$VIM/gvimrc"
    user gvimrc file: "$HOME/.gvimrc"
2nd user gvimrc file: "~/.vim/gvimrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
    system menu file: "$VIMRUNTIME/menu.vim"
  fall-back for $VIM: "/sw/apps/vim/8.0-1360/milou/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12     -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc   -L. -fstack-protector -rdynamic -Wl,-export-dynamic -Wl,-E -Wl,-rpath,/usr/lib64/perl5/CORE   -L/usr/local/lib -Wl,--as-needed -o vim   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -lSM -lICE -lXpm -lXt -lX11 -lXdmcp -lSM -lICE  -lm -ltinfo -lelf -lnsl  -lselinux   -lacl -lattr   -Wl,-E -Wl,-rpath,/usr/lib64/perl5/CORE  -fstack-protector  -L/usr/lib64/perl5/CORE -lperl -lresolv -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc   -L/usr/lib64 -ltcl8.5 -ldl -lieee -lm -Wl,-R/pica/sw/comp/ruby/2.4.1/milou/lib -lruby-static -lpthread -lrt -lgmp -ldl -lcrypt -lm  -L/pica/sw/comp/ruby/2.4.1/milou/lib
</pre>

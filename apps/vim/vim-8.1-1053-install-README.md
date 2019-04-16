vim/8.1-1053
============

<http://www.vim.org/download.php#unix>

LOG
---

    TOOL=/sw/apps/vim
    CLUSTER=${CLUSTER?:CLUSTER must be nonempty}
    mkdir -p $TOOL
    cd $TOOL
    module load gcc/7.4.0
    module load git/2.16.1

Unless you know the version (includes patch level), then build, find out, and rebuild.

    VERSION_TMP=V
    mkdir $VERSION_TMP
    cd $VERSION_TMP
    git clone https://github.com/vim/vim.git
    cd vim
    cd src
    make -j 8
    ./vim --version

Observe output, determine version and highest patch level, then remove temp version directory and start the real version directory.

    VERSION=8.1-1053
    cd $TOOL
    rm -rf $VERSION_TMP
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    [[ -d vim ]] && rm -rf vim
    [[ -d vim ]] || git clone https://github.com/vim/vim.git
    cd vim

Include huge list of features, including interpreters.  Do not load `perl/5.26.2` because of a symbol collision with `libieee`... ?

    module load python/2.7.15 
    module load python3/3.7.2
    module load ruby/2.6.2

    make distclean
    ./configure --with-features=huge --enable-fail-if-missing --enable-pythoninterp --with-python-command=$(which python) --with-python-config-dir=$(dirname `which python`)/../lib/python2.7/config --enable-python3interp --with-python3-command=$(which python3) --with-python3-config-dir=$(dirname `which python3`)/../lib/python3.7/config-3.7m-x86_64-linux-gnu --enable-perlinterp --enable-tclinterp --enable-rubyinterp --with-ruby-command=$(which ruby) --prefix=$PREFIX


    make -j 8
    make install

Did some mucking about to figure out why ruby's so was needed, and ended up
recompiling ruby to include a static library and adjusting the configure line
for vim to that above.  All seems to be OK now.


The output of the `./vim --version` for the built version is:

<pre>
VIM - Vi IMproved 8.1 (2018 May 18, compiled Mar 26 2019 15:19:17)
Included patches: 1-1053
Compiled by douglas@rackham5.uppmax.uu.se
Huge version with GTK2 GUI.  Features included (+) or not (-):
+acl               +extra_search      +mouse_netterm     +tag_old_static
+arabic            -farsi             +mouse_sgr         -tag_any_white
+autocmd           +file_in_path      -mouse_sysmouse    +tcl
+autochdir         +find_in_path      +mouse_urxvt       +termguicolors
-autoservername    +float             +mouse_xterm       +terminal
+balloon_eval      +folding           +multi_byte        +terminfo
+balloon_eval_term -footer            +multi_lang        +termresponse
+browse            +fork()            -mzscheme          +textobjects
++builtin_terms    +gettext           +netbeans_intg     +textprop
+byte_offset       -hangul_input      +num64             +timers
+channel           +iconv             +packages          +title
+cindent           +insert_expand     +path_extra        +toolbar
+clientserver      +job               +perl              +user_commands
+clipboard         +jumplist          +persistent_undo   +vartabs
+cmdline_compl     +keymap            +postscript        +vertsplit
+cmdline_hist      +lambda            +printer           +virtualedit
+cmdline_info      +langmap           +profile           +visual
+comments          +libcall           +python/dyn        +visualextra
+conceal           +linebreak         +python3/dyn       +viminfo
+cryptv            +lispindent        +quickfix          +vreplace
+cscope            +listcmds          +reltime           +wildignore
+cursorbind        +localmap          +rightleft         +wildmenu
+cursorshape       -lua               +ruby              +windows
+dialog_con_gui    +menu              +scrollbind        +writebackup
+diff              +mksession         +signs             +X11
+digraphs          +modify_fname      +smartindent       -xfontset
+dnd               +mouse             +startuptime       +xim
-ebcdic            +mouseshape        +statusline        +xpm
+emacs_tags        +mouse_dec         -sun_workshop      +xsmp_interact
+eval              -mouse_gpm         +syntax            +xterm_clipboard
+ex_extra          -mouse_jsbterm     +tag_binary        -xterm_save
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
  system gvimrc file: "$VIM/gvimrc"
    user gvimrc file: "$HOME/.gvimrc"
2nd user gvimrc file: "~/.vim/gvimrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
    system menu file: "$VIMRUNTIME/menu.vim"
  fall-back for $VIM: "/sw/apps/vim/8.1-1053/rackham/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng15 -I/usr/include/uuid -I/usr/include/pixman-1 -I/usr/include/libdrm     -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc   -L. -fstack-protector-strong -rdynamic -Wl,-export-dynamic -Wl,--enable-new-dtags -Wl,-rpath,/usr/lib64/perl5/CORE   -L/usr/local/lib -Wl,--as-needed -o vim   -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfontconfig -lgobject-2.0 -lglib-2.0 -lfreetype   -lSM -lICE -lXpm -lXt -lX11 -lSM -lICE  -lm -ltinfo -lelf -lnsl  -lselinux   -ldl   -Wl,--enable-new-dtags -Wl,-rpath,/usr/lib64/perl5/CORE  -fstack-protector  -L/usr/lib64/perl5/CORE -lperl -lresolv -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc   -L/usr/lib64 -ltcl8.5 -ldl -lpthread -lieee -lm -Wl,-rpath,/../lib -Wl,-rpath,/../lib -lruby -lm
</pre>

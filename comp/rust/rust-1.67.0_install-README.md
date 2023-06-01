rust/1.67.0
===========

<https://www.rust-lang.org/>

Used under license:
Apache 2.0, MIT

Structure creating script (makeroom_rust_1.67.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/rust/makeroom_167.0.sh

LOG
---

    TOOL=rust
    VERSION=1.67.0
    makeroom.sh -f -t "rust" -v "${VERSION}" -c "comp" -l "Apache 2.0\, MIT" -d "Rust programming language and tools" -w "https://www.rust-lang.org/"
    ./makeroom_rust_${VERSION}.sh

    source /sw/comp/rust/SOURCEME_rust_1.67.0 && cd $SRCDIR

Define `RUSTUP_HOME` and `CARGO_HOME` to `PREFIX`.

After this,

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


Choose 2 to Customize installation.

Keep host triple.
Keep toolchain stable.
Change to complete profile.
Change to NOT modify PATH variable.

You should see installation options:


    default host triple: x86_64-unknown-linux-gnu
    default toolchain: stable
    profile: complete
    modify PATH variable: no


Choose 1 to Proceed with installation.

That's it!  Define `RUSTUP_HOME` and `CARGO_HOME` to `$modroot` in the mf file.

Once this module is set up, load it and do

    cargo install xsv

`xsv` is a fast tool for handling CSV files. This is used by the annotation
tool using the FAVOR_data/1.0 databases.

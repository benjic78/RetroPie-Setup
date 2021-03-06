rp_module_id="osmose"
rp_module_desc="Gamegear emulator Osmose"
rp_module_menus="2+"

function sources_osmose() {
    gitPullOrClone "$md_build" https://github.com/joolswills/osmose-rpi.git
}

function build_osmose() {
    make clean
    # not safe for building in parallel
    make -j1
    md_ret_require="$md_build/osmose"
}

function install_osmose() {
    md_ret_files=(
        'changes.txt'
        'license.txt'
        'osmose'
    )
}

function configure_osmose() {
    mkRomDir "gamegear"
    mkRomDir "mastersystem"

    delSystem "$md_id" "gamegear-osmose"
    delSystem "$md_id" "mastersystem-osmose"
    addSystem 0 "$md_id" "gamegear" "$md_inst/osmose %ROM% -tv -fs"
    addSystem 0 "$md_id" "mastersystem" "$md_inst/osmose %ROM% -tv -fs"
}

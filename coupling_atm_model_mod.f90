module coupling_atm_model_mod

    integer :: ocn_demo_comp_id

    use CCPL_interface_mod

    implicit none

    integer, public             :: ocn_demo_comp_id
    
contains

    subroutine register_ocn_demo_component(comm)
        use CCPL_interface_mod
        integer, intent(inout) :: comm
        ocn_demo_comp_id = CCPL_register_component(-1, "ocn_demo", "ocn", comm, change_dir=.true., annotation = "register ocn model ocn_demo")
    end subroutine register_ocn_demo_component

    subroutine register_component_coupling_configuration

        use CCPL_interface_mod
        use spmd_init_mod, only:mytask_id, npes
        use parse_namelist_mod,only:time_step, coupling_freq
        use grid_init_mod, only:latlen, lonlen
        use decomp_init_mod, only:decomp_size, local_grid_cell_index
        use variable_mod

        implicit none

        grid_h2d_id = CCPL_register_H2D_grid_via_global_data(ocn_demo_comp_id, "ocn_demo_H2D_grid", "LON_LAT", "degrees", "cyclic", lonlen, latlen, 0.0, 360.0, -90.0, 90.0, lon, lat, annotation="register gamil H2D grid ")
        decomp_id = CCPL_register_normal_parallel_decomp("decomp_ocn_demo_grid", grid_H2D_id, decomp_size, local_grid_cell_index(:,local_id+1), &
                    annotation="allocate for gamil grid")

    end subroutine register_component_coupling_configuration

end module coupling_atm_model_mod

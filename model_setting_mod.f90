module model_setting_mod

contains

  subroutine ocn_demo_init
      use mpi
      use parse_namelist_mod
      use CCPL_interface_mod
      use spmd_init_mod
      use coupling_atm_model_mod
      use grid_init_mod
      use decomp_init_mod
      use variable_mod

      implicit none
      integer :: mpicom

      mpicom = CCPL_NULL_COMM
      call register_ocn_demo_component(mpicom)
      call parse_namelist
      call spmd_init(mpicom)
      call grid_init
      call decomp_init
      call variable_init
      !register component coupling configuration (including regisger component, time step, grid, decomp, field, interface)

  end subroutine ocn_demo_init

  subroutine ocn_demo_step_on
      !do i=1,time_length/time_step
      !    sstm = sst_l
      !    !execute interface(do_coupling_CCPL)
      !end do
  end subroutine ocn_demo_step_on

  subroutine finalize_ocn_demo
      use spmd_init_mod
      implicit none
      !deallocate(sst)
      call mpi_finalize(ier)
  end subroutine finalize_ocn_demo
end module model_setting_mod

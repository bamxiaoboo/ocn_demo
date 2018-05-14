program ocn_demo
    use mpi
    use model_setting_mod
    implicit none

    call ocn_demo_init
    !call ocn_demo_step_on
    call finalize_ocn_demo
end program

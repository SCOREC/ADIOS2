!
! Distributed under the OSI-approved Apache License, Version 2.0.  See
!  accompanying file Copyright.txt for details.
!
!  adios2_variable_mod.f90 : ADIOS2 Fortran bindings for Variable class
!
!   Created on: Mar 13, 2017
!       Author: William F Godoy godoywf@ornl.gov
!

module adios2_variable
    use adios2_functions
    implicit none

contains

    !!<
    !! @param variable
    subroutine adios2_variable_name(variable, name, ierr)
        integer(kind=8), intent(in) :: variable
        character(len=:), allocatable, intent(out) :: name
        integer, intent(out) :: ierr

        character(len=1024) :: c_name
        integer :: length

        call adios2_variable_name_f2c(variable, c_name, length, ierr)
        call adios2_StringC2F(c_name, length, name)

    end subroutine

    subroutine adios2_variable_type(variable, type, ierr)
        integer(kind=8), intent(in) :: variable
        integer, intent(out) :: type
        integer, intent(out) :: ierr

        integer :: c_type

        call adios2_variable_type_f2c(variable, c_type, ierr)
        call adios2_TypeC2F(c_type, type)

    end subroutine

    subroutine adios2_variable_ndims(variable, ndims, ierr)
        integer(kind=8), intent(in) :: variable
        integer, intent(out) :: ndims
        integer, intent(out) :: ierr

        call adios2_variable_ndims_f2c(variable, ndims, ierr)
    end subroutine

    subroutine adios2_variable_shape(variable, ndims, shape_dims, ierr)
        integer(kind=8), intent(in) :: variable
        integer, intent(out) :: ndims
        integer(kind=8), dimension(:), allocatable, intent(out) :: shape_dims
        integer, intent(out) :: ierr

        call adios2_variable_ndims_f2c(variable, ndims, ierr)
        allocate (shape_dims(ndims))
        call adios2_variable_shape_f2c(variable, shape_dims, ierr)

    end subroutine

    subroutine adios2_variable_available_steps_start(variable, steps_start, ierr)
        integer(kind=8), intent(in) :: variable
        integer(kind=8), intent(out) :: steps_start
        integer, intent(out) :: ierr

        call adios2_variable_available_steps_start_f2c(variable, steps_start, ierr)
    end subroutine

    subroutine adios2_variable_available_steps_count(variable, steps_count, ierr)
        integer(kind=8), intent(in) :: variable
        integer(kind=8), intent(out) :: steps_count
        integer, intent(out) :: ierr

        call adios2_variable_available_steps_count_f2c(variable, steps_count, ierr)
    end subroutine

    subroutine adios2_set_shape(variable, ndims, shape_dims, ierr)
        integer(kind=8), intent(in) :: variable
        integer, intent(in) :: ndims
        integer(kind=8), dimension(:), intent(in) :: shape_dims
        integer, intent(out) :: ierr

        call adios2_set_shape_f2c(variable, ndims, shape_dims, ierr)
    end subroutine

    subroutine adios2_set_selection(variable, ndims, start_dims, count_dims, &
        & ierr)
        integer(kind=8), intent(in) :: variable
        integer, intent(in) :: ndims
        integer(kind=8), dimension(:), intent(in) :: start_dims
        integer(kind=8), dimension(:), intent(in) :: count_dims
        integer, intent(out) :: ierr

        call adios2_set_selection_f2c(variable, ndims, start_dims, count_dims, &
                                      ierr)
    end subroutine

    subroutine adios2_set_step_selection(variable, step_start, step_count, ierr)
        integer(kind=8), intent(in) :: variable
        integer(kind=8), intent(in) :: step_start
        integer(kind=8), intent(in) :: step_count
        integer, intent(out) :: ierr

        call adios2_set_step_selection_f2c(variable, step_start, step_count, &
                                           ierr)

    end subroutine

end module

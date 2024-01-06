CLASS lhc_travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR travel RESULT result.

ENDCLASS.

CLASS lhc_travel IMPLEMENTATION.

  METHOD get_instance_authorizations.

"cl_abap_behv_aux=>get_current_context(  IMPORTING from_projection = DATA( 'ZFOSL_I_TRAVEL_M' ) ).


  ENDMETHOD.

ENDCLASS.

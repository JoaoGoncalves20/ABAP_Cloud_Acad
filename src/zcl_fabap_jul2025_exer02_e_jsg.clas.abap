CLASS zcl_fabap_jul2025_exer02_e_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_E_JSG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_funcionarios TYPE TABLE OF REF TO zcl_fabap_jul2025_exer02_1_jsg.

    DATA(lo_func_integral) = NEW zcl_fabap_jul2025_exer02_2_jsg( iv_name = 'João Martins'
                                                                 iv_id = 'JM001'
                                                                 iv_salary = '2000.00'
                                                                 iv_bonus = '300.00' ).


    DATA(lo_func_horas) = NEW zcl_fabap_jul2025_exer02_3_jsg( iv_name = 'André Antunes'
                                                                 iv_id = 'AA002'
                                                                 iv_salary = '38.00'
                                                                 iv_hour = '60' ).


    APPEND lo_func_integral TO lt_funcionarios.
    APPEND lo_func_horas TO lt_funcionarios.

    LOOP AT lt_funcionarios INTO DATA(lo_funcionario).

*    out->write( |Nome: { lo_funcionario->gv_name } | ).
*    out->write( |Id: { lo_funcionario->gv_id } | ).
      out->write( |{ lo_funcionario->show_data(  ) }| ).
      out->write( |Salário Calculado: { lo_funcionario->calc_salary( ) } | ).
      out->write( | | ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

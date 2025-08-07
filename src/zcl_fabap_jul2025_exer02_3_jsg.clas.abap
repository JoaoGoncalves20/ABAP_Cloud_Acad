CLASS zcl_fabap_jul2025_exer02_3_jsg DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_1_jsg
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS:
      constructor
        IMPORTING
          iv_name   TYPE string
          iv_id     TYPE string
          iv_salary TYPE decfloat16
          iv_hour  TYPE i OPTIONAL,
      calc_salary REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

  data gv_hours type i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_3_JSG IMPLEMENTATION.


  METHOD calc_salary.

    rv_salary = super->calc_salary( ) * gv_hours.

  ENDMETHOD.


  METHOD constructor.

    super->constructor( iv_name = iv_name iv_id = iv_id iv_salary = iv_salary ).
    gv_hours = iv_hour.

  ENDMETHOD.
ENDCLASS.

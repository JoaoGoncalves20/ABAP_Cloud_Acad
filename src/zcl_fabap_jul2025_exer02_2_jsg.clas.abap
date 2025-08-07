CLASS zcl_fabap_jul2025_exer02_2_jsg DEFINITION
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
          iv_bonus  TYPE decfloat16 OPTIONAL,
      calc_salary REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA gv_bonus TYPE decfloat16.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_2_JSG IMPLEMENTATION.


  METHOD calc_salary.

    rv_salary = super->calc_salary( ) + gv_bonus.

  ENDMETHOD.


  METHOD constructor.

    super->constructor( iv_name = iv_name iv_id = iv_id iv_salary = iv_salary ).
    gv_bonus = iv_bonus.

  ENDMETHOD.
ENDCLASS.

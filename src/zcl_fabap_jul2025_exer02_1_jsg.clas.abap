CLASS zcl_fabap_jul2025_exer02_1_jsg DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

*    TYPES:
*      BEGIN OF ty_employee,
*        name   TYPE string,
*        id     TYPE string,
*        salary TYPE decfloat16,
*      END OF ty_employee.

    METHODS:
      constructor
        IMPORTING
          iv_name   TYPE string
          iv_id     TYPE string
          iv_salary TYPE decfloat16,
      calc_salary RETURNING VALUE(rv_salary) TYPE decfloat16,
*      show_data RETURNING VALUE(rv_data) TYPE ty_employee.
      show_data RETURNING VALUE(rv_data) TYPE string.

  PROTECTED SECTION.

    DATA:
      gv_name   TYPE string,
      gv_id     TYPE string,
      gv_salary TYPE decfloat16.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_1_JSG IMPLEMENTATION.


  METHOD calc_salary.

    rv_salary = gv_salary.

  ENDMETHOD.


  METHOD constructor.

    gv_name = iv_name.
    gv_id = iv_id.
    gv_salary = iv_salary.

  ENDMETHOD.


  METHOD show_data.

*    rv_data = VALUE #( name = gv_name
*                       id = gv_id
*                       salary = gv_salary ).

    rv_data = |Nome: { gv_name }, ID: { gv_id }, Salário: { gv_salary }|.

  ENDMETHOD.
ENDCLASS.

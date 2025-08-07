*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_product DEFINITION FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS create
      IMPORTING
        iv_code         TYPE string
        iv_name         TYPE string
        iv_price        TYPE decfloat16
*        iv_stock        TYPE i
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_product.

    METHODS constructor IMPORTING iv_code  TYPE string
                                  iv_name  TYPE string
                                  iv_price TYPE decfloat16.

    METHODS add_stock IMPORTING iv_quant TYPE i.

    METHODS remove_stock IMPORTING iv_quant          TYPE i
                         RETURNING VALUE(rv_success) TYPE abap_boolean.

    METHODS calc_total_value RETURNING VALUE(rv_total_value) TYPE decfloat16.

    METHODS get_name RETURNING VALUE(rv_name) TYPE string.
    METHODS get_code RETURNING VALUE(rv_code) TYPE string.
    METHODS get_price RETURNING VALUE(rv_price) TYPE decfloat16.
    METHODS get_stock RETURNING VALUE(rv_stock) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA:
      gv_code  TYPE string,
      gv_name  TYPE string,
      gv_price TYPE decfloat16,
      gv_stock TYPE i.

ENDCLASS.



CLASS lcl_product IMPLEMENTATION.

  METHOD create.

    r_result = NEW #(
      iv_code = iv_code
      iv_name = iv_name
      iv_price = iv_price
    ).

  ENDMETHOD.

  METHOD constructor.

    gv_code = iv_code.
    gv_name = iv_name.
    gv_price = iv_price.
    gv_stock = 0.

  ENDMETHOD.

  METHOD add_stock.

    gv_stock += iv_quant.

  ENDMETHOD.

  METHOD remove_stock.

    IF iv_quant <= gv_stock.
      gv_stock = gv_stock - iv_quant.
      rv_success = abap_true.
    ELSE.
      rv_success = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD calc_total_value.

    rv_total_value = gv_price * gv_stock.

  ENDMETHOD.

  METHOD get_code.

    rv_code = gv_code.

  ENDMETHOD.

  METHOD get_stock.

    rv_stock = gv_stock.

  ENDMETHOD.

  METHOD get_name.

    rv_name = gv_name.

  ENDMETHOD.

  METHOD get_price.

    rv_price = gv_price.

  ENDMETHOD.

ENDCLASS.

CLASS zcl_fabap_jul2025_exer03_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER03_JSG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_product1) = lcl_product=>create( iv_name = 'Produto A' iv_code = '10' iv_price = '5.00' ).

    lo_product1->add_stock( 3 ).
    out->write( |Produto: { lo_product1->get_name(  ) } | ).
    out->write( |Stock: { lo_product1->get_stock(  ) } | ).
    out->write( |Valor Total: { lo_product1->calc_total_value(  ) } | ).

  ENDMETHOD.
ENDCLASS.

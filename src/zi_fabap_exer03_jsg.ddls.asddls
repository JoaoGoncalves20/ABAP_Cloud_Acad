@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercício 3 CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER03_JSG
  as select from /dmo/customer
{
  key customer_id                                                                                                             as CustomerId,
      first_name                                                                                                              as FirstName,
      last_name                                                                                                               as LastName,
      street                                                                                                                  as Street,
      city                                                                                                                    as City,
      country_code                                                                                                            as CountryCode,
      concat_with_space( concat_with_space( concat( street, ','), city, 1 ), concat_with_space( '-', country_code, 1 ) , 1  ) as FullAddress
}

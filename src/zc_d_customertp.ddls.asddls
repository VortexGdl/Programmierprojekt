@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custommer Consumption View'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_D_CustomerTP provider contract transactional_query
  as projection on ZR_D_CustomerTP2
{
  key CustomerId,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Customer,
  Street,
  PostalCode,
  City,
  CountryCode,
  PhoneNumber,
  EmailAddress,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  /* Associations */
  _Bookings   : redirected to composition child ZC_D_BookingTP
}

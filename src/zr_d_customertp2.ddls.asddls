@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Restricted View'
define root view entity ZR_D_CustomerTP2 as select from ZI_D_Customer

composition [0..*] of ZR_D_BookingTP2    as _Bookings
//  association [1..1] to ZI_054906_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId

{
  key CustomerId,
  FirstName,
  LastName,
  Title,
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
  
  //Association
  _Bookings
}

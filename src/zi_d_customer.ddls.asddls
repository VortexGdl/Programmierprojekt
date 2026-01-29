@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Interface'
define view entity ZI_D_Customer as select from /dmo/customer
{
  key customer_id as CustomerId,
  first_name as FirstName,
  last_name as LastName,
  title as Title,
  
  concat_with_space(concat_with_space(title, first_name, 1), last_name, 1) as Customer,
  street as Street,
  postal_code as PostalCode,
  city as City,
  country_code as CountryCode,
  phone_number as PhoneNumber,
  email_address as EmailAddress,
  
  //Administrativ Data
        @Semantics.user.createdBy: true
  
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}

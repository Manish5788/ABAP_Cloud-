@AbapCatalog.sqlViewName: 'ZCDS_HEAD_MKR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Implemeting DCL'
define view zcds_poheader_dbmkr
  as select from zpoheader_dbmkr
{
  key po_order              as PoOrder,
      po_desc               as PoDesc,
      po_type               as PoType,
      comp_code             as CompCode,
      po_org                as PoOrg,
      po_status             as PoStatus,
      supplier              as Supplier,
      imageurl              as Imageurl,
      create_by             as CreateBy,
      created_date_time     as CreatedDateTime,
      changed_date_time     as ChangedDateTime,
      local_last_changed_by as LocalLastChangedBy
}

tableextension 52122401 "Sales Invoice Line EXT" extends "Sales Line"
{
    Caption = 'Sales Invoice Line Table Extension';
    fields
    {
        field(52122400; "Unit Price Check"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Price Check';
        }
        // Add changes to table fields here
    }

}
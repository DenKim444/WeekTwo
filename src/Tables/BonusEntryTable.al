table 52122403 "Bonus Entry"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus Entry';

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
            Editable = false;
        }
        field(2; "Bonus No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bonus Code';
            TableRelation = "Bonus Header";
            Editable = false;
        }
        field(3; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No';
            Editable = false;
            TableRelation = "Sales Invoice Line";
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Posting Date';
            Editable = false;
        }
        field(5; "Item No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item';
            Editable = false;
            TableRelation = Item;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bonus Amount';
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }



}
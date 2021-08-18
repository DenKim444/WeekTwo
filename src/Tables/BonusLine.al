table 52122401 "Bonus Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Type"; Enum "Bonus Type")
        {
            DataClassification = CustomerContent;
        }
        field(3; "Item No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = if (Type = filter(Item)) Item;
        }
        field(4; "Bonus Perc"; Integer)
        {
            MinValue = 0;
            MaxValue = 100;
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(PK; "Document No.", Type, "Item No")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
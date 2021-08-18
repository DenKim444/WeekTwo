table 52122400 "Bonus Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Bonus List";
    DrillDownPageId = "Bonus List";

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Customer No."; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            begin
                if Custmer.Get("Customer No.") then
                    "Customer Name" := Custmer.Name;
            end;
        }
        field(7; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Name';
            Editable = false;
        }
        field(3; "Starting Date"; date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';
        }
        field(4; "End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'End Date';
        }
        field(5; Status; Enum "Bonus Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
        field(6; Type; Enum "Bonus Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Type';
        }
        field(8; "Created By"; Code[30])
        {
            Caption = 'Created By';
            Editable = false;
        }
        field(9; "No Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.", "Customer No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        Custmer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BonusSetup: Record "Bonus Setup";


    trigger OnInsert()
    begin
        "Created By" := UserId;
        if ("No." = '') then begin
            BonusSetup.Get();
            BonusSetup.TestField("Bonus Nos");
            NoSeriesMgt.InitSeries(BonusSetup."Bonus Nos", xRec."No.", 0D, "No.", "No Series");
        end;
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
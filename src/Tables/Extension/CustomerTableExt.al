tableextension 52122400 "Customer Table EXT" extends Customer
{
    fields
    {
        field(52122400; "Bonuses"; Integer)
        {
            //DataClassification = ToBeClassified;
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
        BonusExistsErr: Label 'You can not delete Customer %1 because there is at least one Bonus assigned.';

    trigger OnDelete()
    var
        BonusHeader: Record "Bonus Header";
    begin
        BonusHeader.SetRange("Customer No.", "No.");
        if not BonusHeader.IsEmpty then
            Error(BonusExistsErr, "No.");

    end;


}
codeunit 52122401 "Bonus Calculation Test"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    //Step 1: Calculate Bonus
    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusHeader: Record "Bonus Header";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        BonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        BonusHeader.SetRange(Status, BonusHeader.Status::Released);
        BonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
        BonusHeader.SetFilter("End Date", '%1..', SalesInvLine."Posting Date");
        if BonusHeader.IsEmpty() then
            exit;
        if BonusHeader.FindSet() then
            repeat
                //Create a procedure to find bonuses
                FindBonusForAllItems(BonusHeader, SalesInvLine);
                FindBonusForOneItem(BonusHeader, SalesInvLine);
            Until BonusHeader.Next() = 0;
    end;

    //Step 2: Find Bonus for All items and Specific items
    local procedure FindBonusForAllItems(var BonusHeader: Record "Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record "Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::"All Items");
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure FindBonusForOneItem(var BonusHeader: Record "Bonus Header"; var SalesInvLine: Record "Sales Invoice Line");
    var
        BonusLine: Record "Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::Item);
        BonusLine.SetRange("Item No", SalesInvLine."No.");
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    //Step: 3 Insert Entries into the Bonus Entry Table
    local procedure InsertBonusEntry(var BonusLine: Record "Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusEntry: Record "Bonus Entry";
        EntryNo: Integer;
    begin
        if BonusEntry.FindLast() then
            EntryNo := BonusEntry."Entry No" + 1
        else
            EntryNo := 1;
        BonusEntry.Init();
        BonusEntry."Entry No" := EntryNo;
        BonusEntry."Bonus No." := BonusLine."Document No.";
        BonusEntry."Document No." := SalesInvLine."Document No.";
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry."Posting Date" := SalesInvLine."Posting Date";
        BonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * BonusLine."Bonus Perc" / 100;
        BonusEntry.Insert();
    end;

}

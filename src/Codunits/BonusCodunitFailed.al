// codeunit 52122400 "Bonus Calculation"
// {

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
//     local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
//     begin
//         RunOnAfterSalesInvLineInsert(SalesInvLine);
//         CalculateBonus(SalesInvLine);
//     end;

//     local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
//     var
//         BonusHeader: Record "Bonus Header";
//     begin
//         IF SalesInvLine.Type <> SalesInvLine.Type::Item then
//             exit;
//         BonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
//         BonusHeader.SetRange(Status, BonusHeader.Status::Released);
//         BonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
//         BonusHeader.SetFilter("End Date", '%1..', SalesInvLine."Posting Date");
//         if BonusHeader.IsEmpty then
//             exit;
//         IF BonusHeader.FindSet() then
//             repeat
//                 // we need to calculate bonus for the record with both All Items and Specific items as well.
//                 //we will procedure for CalculateAllItems and CalculateItems
//                 FindBonusForAllItems(BonusHeader, SalesInvLine);
//                 FindBonusForOneItem(BonusHeader, SalesInvLine);
//             until BonusHeader.Next() = 0;

//     end;

//     local procedure FindBonusForAllItems(var BonusHeader: Record "Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
//     var
//         BonusLines: Record "Bonus Line";
//     begin
//         BonusLines.SetRange("Document No.", BonusHeader."No.");
//         BonusLines.SetRange(Type, BonusLines.Type::"All Items");
//         IF BonusLines.FindFirst() then
//             //Insert Lines -- Procodure
//             InsertBonusEntry(BonusLines, SalesInvLine);

//         exit;
//     end;

//     local procedure FindBonusForOneItem(var BonusHeader: Record "Bonus Header"; var SalesInvLines: Record "Sales Invoice Line")
//     var
//         BonusLines: Record "Bonus Line";
//     begin
//         BonusLines.SetRange("Document No.", BonusHeader."No.");
//         BonusLines.SetRange(Type, BonusLines.Type::Item);
//         BonusLines.SetRange("Item No", SalesInvLines."No.");
//         if BonusLines.FindFirst() then
//             // Insert from the Record Insert Procedure
//             InsertBonusEntry(BonusLines, SalesInvLines);
//     end;

//     local procedure InsertBonusEntry(var BonusLines: Record "Bonus Line"; var SalesInvoiceLines: Record "Sales Invoice Line")
//     var
//         EntryNo: Integer;
//         BonusEntry: Record "Bonus Entry";
//     begin
//         if BonusLines.FindLast() then
//             EntryNo := BonusEntry."Entry No" + 1
//         else
//             EntryNo := 1;

//         BonusEntry.Init();
//         BonusEntry."Entry No" := EntryNo;
//         BonusEntry."Bonus No." := BonusLines."Document No.";
//         BonusEntry."Document No." := SalesInvoiceLines."Document No.";
//         BonusEntry."Item No." := SalesInvoiceLines."No.";
//         BonusEntry."Posting Date" := SalesInvoiceLines."Posting Date";
//         BonusEntry."Bonus Amount" := SalesInvoiceLines.Amount * BonusLines."Bonus Perc" / 100;
//         BonusEntry.Insert();

//     end;


//     var
//         myInt: Integer;
// }
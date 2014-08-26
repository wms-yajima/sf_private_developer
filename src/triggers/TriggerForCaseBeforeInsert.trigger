trigger TriggerForCaseBeforeInsert on Case (Before Insert) {
    CaseMngmnt.SetValueRecieveForm(Trigger.new);
}
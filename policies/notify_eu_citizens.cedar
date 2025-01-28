//
// Notify European Citizens that their sessions are being recorded
// recorded to comply with German work council and others
//
@notify("When connecting to this resource, your actions are being recorded to comply with company policy. If you don't agree please disconnect immediately")
permit (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    context.location in Location::Continent::"EU"
};

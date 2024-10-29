//
// Restrict connecting to a critical database to only during business hours
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource in StrongDM::Resource::"rs-2341234123412341"
) unless {
    [2, 3, 4, 5, 6].contains(context.utcNow.dayOfWeek) &&
    context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() > 10 &&
    context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() < 17
};

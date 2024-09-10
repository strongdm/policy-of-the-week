//
// Forbid and revoke sessions to Prod resources from unhealthy endpoints
//
@logout("")
forbid (
  principal,
  action == StrongDM::Action::"connect",
  resource
) when {
  context.trust.status == "bad" &&
  (resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod")
};

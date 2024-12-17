//
// Restrict access to resources to EU for GDPR resources
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    resource.sdm.tags has compliance && resource.sdm.tags.compliance == "GDPR"
} unless {
    // EU member states under GDPR regulation
    context.location in [
        Location::Country::"AT", // Austria
        Location::Country::"BE", // Belgium
        Location::Country::"BG", // Bulgaria
        Location::Country::"HR", // Croatia
        Location::Country::"CY", // Cyprus
        Location::Country::"CZ", // Czech Republic
        Location::Country::"DK", // Denmark
        Location::Country::"EE", // Estonia
        Location::Country::"FI", // Finland
        Location::Country::"FR", // France
        Location::Country::"DE", // Germany
        Location::Country::"GR", // Greece
        Location::Country::"HU", // Hungary
        Location::Country::"IE", // Ireland
        Location::Country::"IT", // Italy
        Location::Country::"LV", // Latvia
        Location::Country::"LT", // Lithuania
        Location::Country::"LU", // Luxembourg
        Location::Country::"MT", // Malta
        Location::Country::"NL", // Netherlands
        Location::Country::"PL", // Poland
        Location::Country::"PT", // Portugal
        Location::Country::"RO", // Romania
        Location::Country::"SK", // Slovakia
        Location::Country::"SI", // Slovenia
        Location::Country::"ES", // Spain
        Location::Country::"SE"  // Sweden
    ]
};

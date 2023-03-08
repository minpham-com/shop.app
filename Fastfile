lane :ios_beta do
    increment_build_number
    build_app
    upload_to_testflight
end

lane :ios_release do
    capture_screenshots
    build_app
    upload_to_app_store       # Upload the screenshots and the binary to iTunes
    slack                     # Let your team-mates know the new version is live
end

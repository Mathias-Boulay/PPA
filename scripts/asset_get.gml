///asset_get(Str);
asset=asset_get_index(argument0);
if asset = -1{
    print_error("[AssG] No Asset Found");
    print_warning("[AssG] Fallback to NoTexture sprite")
    asset= asset_get_index("sprite_NT");
    return asset;
    }
else{
    print_debug("[AssG] Asset found: "+string(asset));
    return asset;
    }

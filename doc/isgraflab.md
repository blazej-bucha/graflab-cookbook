# isGrafLab Command Line Interface

Function prototype for isGrafLab:

```
function out = isGrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_path, ...
    crd, ...
    ts, ...
    lat_grd_min, ...
    lat_grd_step, ...
    lat_grd_max, ...
    lon_grd_min, ...
    lon_grd_step, ...
    lon_grd_max, ...
    h_grd, ...
    is_path, ...
    is_mat_or_vec, ...
    out_path, ...
    quantity, ...
    fnALFs, ...
    DTM_path, ...
    export_data_txt, ...
    export_report, ...
    export_data_mat, ...
    display_data, ...
    graphic_format, ...
    colormap, ...
    number_of_colors, ...
    dpi, ...
    status_bar)
```

Many of the parameters are the same as in [GrafLab](./graflab.md). Below are
explained only the new ones that are unique to isGrafLab.

* `ts` -- Order of the Taylor series

* `is_path` -- Path to the irregular surface file

* `is_mat_or_vec` -- Structure of the irregular surface in `is_path`

  * `0` -- matrix

    ```
     --                                         --
    |                                             |
    | H(lat_n, lon_1)     ...     H(lat_n, lon_m) |
    |                                             |
    |        .            .                       |
    |        .             .                      |
    |        .              .                     |
    |                                             |
    | H(lat_1, lon_1)     ...     H(lat_1, lon_m) |
    |                                             |
     --                                         --
    ```

  * `1` -- vector

    ```
     --             --
    |                 |
    | H(lat_1, lon_1) |
    |        .        |
    |        .        |
    |        .        |
    | H(lat_n, lon_1) |
    |        .        |
    |        .        |
    |        .        |
    | H(lat_1, lon_m) |
    |        .        |
    |        .        |
    |        .        |
    | H(lat_n, lon_m) |
    |                 |
     --             --
    ```

  where

  * `H` is the height of the irregular surface above the reference surface (see
    `h_grd` in [GrafLab](graflab.md) for the definition of the reference
    surface)

  * `lat_1` and `lat_n` are the minimum and the maximum grid latitudes,
    respectively

  * `lon_1` and `lon_m` are the minimum and the maximum grid longitudes,
    respectively


You should now be ready to return [back](../README.md) and go through the
HOWTOs.

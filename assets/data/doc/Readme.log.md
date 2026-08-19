# Log zip

## Introduction

This is the "log.zip" file, it contains the various debug data used to analyze (and later improve) the sculpting result.

In the following the contents of the file will be explained. Note that some files are not always added to the log.zip, so
some data might be missing.

Also note that this text file might be outdated a bit (although we try to keep it in sync with the code).

## log.txt - Main log

The file "log.txt" contains the main debug log of the application. Various information can be extracted from the log.
A few examples:

* `SetEnvCondition(0,35.200001)` : The current battery temperatures (degrees Celsius)
* `SetEnvCondition(1,10.490872)` : The current illumination/light (EV values)
* `SetEnvCondition(2,94.000000)` : The current battery level (%)
* `SetEnvCondition(3,19452.000000)` : The current free storate (MB)
* `RunOneIterationMT: MemResKB=144180 MemVirtKB=1929176` : The memory used currently
* `pose: rot=[0.00911472,0.226329,0.0467926,0.972884] pos=[-0.132379,-0.00476465,0.0356236,0]` : The current pose (quaternion + position)
* ...etc...

## metadata.xml - Generic metadata

Currently it simply stores the image resolution used internally in the pipeline:

    <metadata cam_width="640" cam_height="360" />

## rel_pose.txt - Camera trajectory (relative values)

This file contains the camera trajectory, straight out of the pose estimation.
Note that the values (the position) is in a different scale, since these values are calculated before
a scale is estimated.

## sphinx_pose.txt - Camera trajectory

This file contains the camera trajectory.
Note that the scale varies until the meshing starts! This is due to the fact that before meshing the scale is
estimated several times.

## slamstate_fba.bin, slamstate.bin - A dump of the SlamState data structure, before the forced global bundle adjustment and at the end

Contains the feature point from the global map, the keyframes and all observations (measurements).

The file is a binary file, the format might change in the future. The current format is the following:

* Header (8 bytes), currently "SLSTATE1" (the number 1 in the end is the file format version number)
* num_kf (int32_t = 4 bytes) - Number of keyframes
* num_fp (int32_t = 4 bytes) - Number of feature points
* num_kf * ? bytes - Dump of keyframe data (variable sized items!)
* num_fp * ? bytes - Dump of feature point data (variable sized items!)

A keyframe dump item has the format:

* id (int32_t = 4 bytes) - The ID of the keyframe (NOT the frame number!)
* frame_no (int32_t) - The Frame/View ID
* num_obs (int32_t) - The number of observations
* pose (SlamPose = 52bytes) - The pose of the keyframe (in SlamPose format, see SlamPose class for details)
* dist_to_obj_ (float = 4 bytes) - Keyframe distance to object center
* pose_stable_ (bool = 1 byte) - 1 if the pose was reliable, 0 if it might be incorrect (e.g. motion blur detected)
* fg_bg (float = 4 bytes) - Fg/Bg separation value
* exp_val_ (float = 4 bytes) - Exposure compensation value for the keyframe
* num_obs * observations

The observations format:

* id (int32_t) - The feature point id
* x, y (2*float = 8 bytes) - The feature point position in normalized image coordinates (Xn = (Xp - Cx) / fx)

A feature point dump item has the format:

* id (int32_t = 4 bytes) - The ID of the feature point
* X (3*float = 12 bytes) - The 3D coordinate of the feature point
* triangulated (bool = 1 byte) - Set to true, if the point has a 3d coordinate
* tracked (bool) - Not important
* found (bool) - Not important
* bg_point (bool) - Set to true, if the feature point is in the background
* removal_reason (enum = 4 bytes) - Not important
* normal (3*float = 12 bytes) - The estimated normal of the feature point
* pyr_level (uint8_t = 1 byte) - The pyramid level of the feature point
* last_searched (int = 4 bytes) - Not important
* score (int = 4 bytes) - Not important
* x (2*float = 8 bytes) - Not important
* C (Eigen::Matrix3f = 36 bytes) - The point's covariance matrix
* num_obs (int32_t) - Number of observing keyframes
* observingCams (num_obs * int = num_obs * 4 bytes) - Array of observing keyframes, sorted (NOTE: contains keyframe IDs and not Frame IDs!)

## sensor_queue.bin - Sensor data

A dump of all the sensor logs during scanning. The format is pretty simple:

* 4 bytes: the magick value "SQUE"
* 4 bytes: number of sensor events
* 8 bytes: monotonic_start_clock (used for syncing the event clocks)
* 8 bytes: boottime_start_clock (used for syncing the event clocks)
* rest of the data: array of SensorEvent objects

```C++
struct SensorEvent {
    uint64_t received_timestamp_ns;
    uint64_t timestamp_ns;
    Vec4 xyz;
    EventType type;
};
```

## kfdump.* - Spray painting keyframe data

NOTE: These might go away in the future.

## pose_kf/* - Pose estimation keyframe data

* kf_*.jpeg - These are the full color high resolution keyframe images. Index with the view number.

## features/*

These files store the feature coordinates for each frame (not just keyframes).
The data depends on the state the application was in.

Each file is a binary dump of an array:

* the first 4 bytes store the number of items
* the rest of the data is the exact memory dump of the array content

The files are the followin:

* *_start_bin - This is a dump of detected features in the "pre-init" or "start" state. It's a dump of `std::vector<cv::Point2f>`.
* *_init_x1.bin - During the auto-init phase, this is the array of the initial feature coordinates. It's a dump of `std::vector<cv::Point2f>`.
* *_init_x2.bin - During the auto-init phase, this is the array of the final feature coordinates. It's a dump of `std::vector<cv::Point2f>`.
* *_track_x2.bin - During tracking phase, this is the array of feature coordinates. It's a dump of `std::vector<cv::Point2f>`.
* *_track_id.bin - During tracking phase, this is the array of feature IDs. It's a dump of `std::vector<int>`.

## blob/blob_*.bin

These files contain debug data useful to analyze the blob placement.
Each bin file is a dump of an array of `Array<Slam::BlobDebugData>`:

* The first 4 bytes is the number of items
* The remaining bytes are array of the following structure:

```C++
    struct BlobDebugData {
        enum {
            kTypePoint = 0, // Point (e.g. feature point)
            kTypeSphere,    // 3D Sphere (e.g. blob)
            kTypeCenter,    // A center of something
            kTypeMatCol,    // One column of a Mat4 (expected 4 of them one after the other)
        };
        Vec4 pos;           // Position of data
        float size;         // Optional size of data (needed for sphere)
        uint32_t color;     // Color of data
        char data_type;     // Type of data (point or sphere, see kType*)
    };
```

The best way to visualize this data is using the LogAnalizer.

## disp/*

The files store the disparity/depth maps and metadata needed to re-create the pointclouds.

* disp_*.xml - Contains the metadata (see below for details)
* disp_*_d.bin - Contains the disparity map (12.4 bits fixed point, w*h values)
* disp_*_m.bin - Contains the monochrome image

Here is an example metadata with explanations (linebreaks added for readability):

```xml
<?xml version="1.0"?>
<dispdump>
        <global_params scale="2" w="320" h="180" />
        <params fl="197.042038" px="364.805695" py="96.6091385" bl="-0.0136213629" />
        <pose pm0="-0.663852692" pm1="-0.358910918" pm2="0.656111419" pm3="-0.223371118"
            pm4="0.0775000006" pm5="0.839576066" pm6="0.537685513" pm7="-0.117404386"
            pm8="-0.743836701" pm9="0.407792747" pm10="-0.529539227" pm11="0.345276713"
            pm12="0" pm13="0" pm14="0" pm15="1" />
</dispdump>
```

* _global_params_ - These are parameters which are the same for every frame:
  * _scale_ - The global scale down factor. For example, to get the original image size, the width and height
              stored here must be multiplied with the scale.
  * _w_, _h_ - The size of the saved buffers
* _params_ - Parameters specific to this frame:
  * _fl_ - The focal length in pixels
  * _px_, _py_ - The principal point coordinates
  * _fl_ - The baseline
* _pose_ - The camera pose matrix

__NOTE__: The frame numbers might not match the frame numbers in the pose, since the disparity estimation and
sculpting has it's own pipeline. The syncing between the frames needs to be calculated from the log!

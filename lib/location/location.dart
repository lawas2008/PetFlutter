import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';

///地图插件
class Location extends StatefulWidget {
  @override
  _LocationState createState() => new _LocationState();
}

class _LocationState extends State<Location> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: AmapView(
        // 地图类型 (可选)
        mapType: MapType.Standard,
        // 是否显示缩放控件 (可选)
        showZoomControl: true,
        // 是否显示指南针控件 (可选)
        showCompass: true,
        // 是否显示比例尺控件 (可选)
        showScaleControl: true,
        // 是否使能缩放手势 (可选)
        zoomGesturesEnabled: true,
        // 是否使能滚动手势 (可选)
        scrollGesturesEnabled: true,
        // 是否使能旋转手势 (可选)
        rotateGestureEnabled: true,
        // 是否使能倾斜手势 (可选)
        tiltGestureEnabled: true,
        // 缩放级别 (可选)
        zoomLevel: 10,
        // 中心点坐标 (可选)
        centerCoordinate: LatLng(39, 116),
        // 标记 (可选)
        markers: <MarkerOption>[],
        // 标识点击回调 (可选)
        onMarkerClicked: (Marker marker) {},
        // 地图点击回调 (可选)
        onMapClicked: (LatLng coord) {},
        // 地图拖动开始 (可选)
        onMapMoveStart: (MapMove move) {},
        // 地图拖动结束 (可选)
        onMapMoveEnd: (MapMove move) {},
        // 地图创建完成回调 (可选)
        onMapCreated: (controller) async {// requestPermission是权限请求方法, 需要你自己实现
        },
      ),
    );
  }
}

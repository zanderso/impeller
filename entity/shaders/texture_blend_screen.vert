// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

uniform FrameInfo {
  mat4 mvp;
  mat4 dst_uv_transform;
  mat4 src_uv_transform;
} frame_info;

in vec2 vertices;
in vec2 texture_coords;

out vec2 v_dst_texture_coords;
out vec2 v_src_texture_coords;

void main() {
  gl_Position = frame_info.mvp * vec4(vertices, 0.0, 1.0);
  v_dst_texture_coords =
      (frame_info.dst_uv_transform * vec4(texture_coords, 1.0, 1.0)).xy;
  v_src_texture_coords =
      (frame_info.src_uv_transform * vec4(texture_coords, 1.0, 1.0)).xy;
}

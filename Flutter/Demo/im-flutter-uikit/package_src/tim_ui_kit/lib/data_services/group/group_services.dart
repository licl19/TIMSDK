import 'package:tencent_im_sdk_plugin/enum/V2TimGroupListener.dart';
import 'package:tencent_im_sdk_plugin/enum/group_member_filter_enum.dart';
import 'package:tencent_im_sdk_plugin/enum/group_member_role_enum.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_full_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_operation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_search_param.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_search_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_search_param.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';

abstract class GroupServices {
  Future<List<V2TimGroupInfo>?> getJoinedGroupList();

  Future<List<V2TimGroupInfoResult>?> getGroupsInfo({
    required List<String> groupIDList,
  });

  Future<V2TimGroupMemberInfoResult?> getGroupMemberList({
    required String groupID,
    required GroupMemberFilterTypeEnum filter,
    required String nextSeq,
    int count = 15,
    int offset = 0,
  });

  Future<V2TimValueCallback<List<V2TimGroupMemberFullInfo>>>
      getGroupMembersInfo(
          {required String groupID, required List<String> memberList});

  Future<V2TimCallback> setGroupInfo({
    required V2TimGroupInfo info,
  });

  Future<V2TimCallback> setGroupMemberRole({
    required String groupID,
    required String userID,
    required GroupMemberRoleTypeEnum role,
  });

  Future<V2TimCallback> muteGroupMember({
    required String groupID,
    required String userID,
    required int seconds,
  });

  Future<V2TimCallback> setGroupMemberInfo({
    required String groupID,
    required String userID,
    String? nameCard,
    Map<String, String>? customInfo,
  });

  Future<V2TimCallback> kickGroupMember({
    required String groupID,
    required List<String> memberList,
    String? reason,
  });

  Future<V2TimValueCallback<List<V2TimGroupMemberOperationResult>>>
      inviteUserToGroup({
    required String groupID,
    required List<String> userList,
  });

  Future<V2TimValueCallback<List<V2TimGroupInfo>>> searchGroups({
    required V2TimGroupSearchParam searchParam,
  });

  Future<V2TimValueCallback<V2GroupMemberInfoSearchResult>> searchGroupMembers({
    required V2TimGroupMemberSearchParam searchParam,
  });

  Future<V2TimCallback> joinGroup({
    required String groupID,
    required String message,
  });

  Future<void> addGroupListener({
    required V2TimGroupListener listener,
  });

  Future<void> removeGroupListener({
    V2TimGroupListener? listener,
  });
}

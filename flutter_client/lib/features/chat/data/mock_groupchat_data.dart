import 'package:flutter/material.dart';

import '../models/groupchat_models.dart';

const mockActiveBoardRooms = [
  ActiveBoardRoom(
    name: 'Speakeasy',
    hasUnreadActivity: true,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCN8fcmv-DZ2iysYFLwdRI3kZxxE306yXQwBD589xO5n98K_0zlgOGzSvO_syRy9qc2nSMz_zngHlJps63y3HbVIQN2m7Zi4vRKMK0X36kXMkIBcI89AiLr7jKX6iMg8kluE303ShrvuiskXMZqvviyHHanhklQrZm-9cehFnp8LxEn3FY_2QQxlfw2l9Mik7ea67milicTBfq1BCD5i34cWRZ2cV--UCbbT_10ZMZnyL4ko-M8aWGAUc-Qpl26UcDqvGIX4byyoIs',
  ),
  ActiveBoardRoom(
    name: 'Collectors',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuC1solcUKCBjp9fc5fkhu8lqKg0JvBIytYk8z5rdgk0L4nJ5CBNZa0t8wM130K8xGtl7FmXzRjzILji0nJGXOBO6AgLANcRHcgMUZGpyOM8fwxyGe6Y0COT9SozcLC0z_P-g9IPykaOmSue0O7FaEe3lF0QD3eDkB62LUHOdwGRt-Z9uL1lVxbJYxWAGGSo46ETv7kkLCJxkGlEKNoMQRkYmW6BQiDLThogLwQ3gn_hwqMn85T6ekMF74lZpigwR72trt7paGQsOwI',
  ),
  ActiveBoardRoom(
    name: 'Local Brews',
    hasUnreadActivity: true,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuD4qzuZ2DnuqvF2xIztFIb-tsM5UgV6-dShCupahPOMP9GSArVHOZCN2zWI1DrhyUbRTfyWhihRIgrT9BbmaKK9prPpq7VrB2Bt4kLnz8w48CcM2H233xtzi1ZZ_cwO74bGWWyiTOuAW6G6_BwF44aFwOW1yIqMUxsTZW_vsW8w1lI6-CL9LIJpDNUYHV4XRhCKpUvXY6GK4BUdKLw-6fWEbZrOIFWMaPiOEp7vRp2tjNgsC0PouTFmbjsxnvNiS_HS7N0zfgLqKuI',
  ),
  ActiveBoardRoom(
    name: 'Tasting',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuB79G5wF_quQQFNcmNo8JXiBRthRVAv50549n29UtYpNzYZeJqVXk1o7Nf0fx27zj1Yjgqr11zKd0yB4vzO5t9PcdW6Wr7sR8y2kNpOZeWjiX-2hOtXjk0Xsh7vvB3D5W5B1UDq41GnTS2sqa4Mir7nnd-qOlFA7elvGM-8N6Kgo2o05zouGFPp8IHtPIPtXn4EEKkNkDAltHwcY1-NFyCpXxwjCcssGhVD-sAgUp0vHgFqzzmKeZeRcvGYDQSY9OughGEdHAKXYGY',
  ),
  ActiveBoardRoom(
    name: 'Wine Club',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCpFM6NlzAhyFKUNuEzO22ZdMfBZ3BNmZ_DfrKTsY-uGnIzgSjjDp-SQM5beucCaBYfVnfzC5vL9k4hqslN7DeGX69W2Q6yrEFnt25bAn79QaLaw6W6cRI0CH-_As9tLTHsIhjgBitgAFcD63r8yTzruIQ24hOyikyCNjItVNfPZL40xSXVj2-5sYc-KMjStjWWwK300lhSkzsx8CcNlkWnGDzC5kF6AwQsMMQkUmTCn8xGnbn_ND68UmkjkU95FOqJbWgExa1NrTw',
  ),
];

const _avatarMarcus =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDcPv5GXTy0va4GXhy6xdz0UiFhgvbknXRk9KXgm9wLUQjAuUDH2fIxfWzQCmtlfnTIe1x27QuhpwjSNvqoJvVlK7TeGW4RZsUnlTm8HHcMRMS-NbWZD09iWTv_fcAzub6z1KvfHOGnVkg8dN_m7kjY4DqYipEIcoAuSDeZdxkFP-l22CVw9uIBf2mhphHWHm_8p16PvXflKMRlRrQjXgkxBRHs1FDOJlCklOtkCZOiyrJMa98331femU1I3tmA0z58sXg3Lbgta3E';
const _avatarSarah =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB8VVvlpJHbSdz1UnPz_P2AHoyZv5RYBSe-RgeqEb2qvmcl04V59WEWlv6tRWAO6TyxGZBflYvks5Ly9qIstiEasZgvBuI9lolMr2ZUxCBMTSwO2k3zjBBfQAAlQGMzXZ6YPpt0xIpLd-nUFkQQkm5yha7wxeBZBbhVvG3noArbrS2wg4aOWbeTjO2g9dbCwl9KZrx9pVqIIuPHBrKy_c1-18mOqUG3kXZVZ-qKyj4NK2utE048VypMTTsR49y0N5ZJovNQAaKFWA0';
const _avatarElena =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuASE0L44TCaBdiObSrBMFik8XKZUp8W4yvRmi0jx02gIGUPJwHwTQcG9l0nWorbXc4zAqo3hdjeoHFsW-8avWyt6AVAcEz0TfWGXj9wDqgFlFDCuJLt8t6ZCzy4AmdAKZ4z2EUUOzmFTRmlQ7HPFzPgDxvHIbYMLwTUFbTaXV-dSqdm9DRe5sXvXZHTY3BbJN6JqMIaheXfecoLwVFIrTuRPtwZ0t6Fb6b0A2OrUBSgIhT7O72s4yRMHzE6p-HUqNB3AVczMGjx4e0';
const _avatarJasmine =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD_DJ5mf5pZ73J2qoIRuES4AJinyh33R3qMPmSQYtQsKuSwZ0zib_yhOzS6cgzXxl9mBDXNR4NKThmL5t_xKsHtMYFw1e4xmsm0Y7ZBcgWUSg0OEdyoqIFQB37JxKQjJNdxGPTC90saFhZ1oO4Cx56rcv7POt69MzsKIdF0i7OcewwycIrPdsOzxBQlDYOasR61cy3A_-ZsrzIcrr6o0C1BOVpPHgeS2W8XzIVYclFkMYw8JXqommiaeFQJtt-QxMk3tjC0A-RRuhE';

const mockGroupchatRooms = [
  GroupchatRoomSummary(
    roomId: 'mock-room-1',
    title: 'Westside Bourbon Enthusiasts',
    memberSummary: '18/25',
    location: 'Westside',
    lastMessage: 'Marcus: Found that limited batch of Old Forester!',
    timeLabel: '12:45 PM',
    unreadCount: 2,
    tags: ['#bourbon', '#rare-finds'],
    avatarUrls: [_avatarMarcus, _avatarSarah, _avatarElena],
    extraMemberCount: 15,
  ),
  GroupchatRoomSummary(
    roomId: 'mock-room-2',
    title: 'Downtown Whiskey Circle',
    memberSummary: '12/20',
    location: 'Downtown',
    lastMessage: 'Sarah: Are we still meeting for the blind tasting tomorrow?',
    timeLabel: 'Yesterday',
    isMuted: true,
    tags: ['#tasting', '#educational'],
    avatarUrls: [_avatarSarah, _avatarJasmine, _avatarElena],
    extraMemberCount: 8,
  ),
  GroupchatRoomSummary(
    roomId: 'mock-room-3',
    title: 'Vintage Cellar Logistics',
    memberSummary: '8/10',
    location: 'Arts District',
    lastMessage: 'Elena: Your order of the 2018 vintage is ready.',
    timeLabel: 'Sun',
    unreadCount: 1,
    tags: ['#wine-pickup', '#logistics'],
    avatarUrls: [],
    trailingIcon: Icons.inventory_2,
  ),
  GroupchatRoomSummary(
    roomId: 'mock-room-4',
    title: 'Hoppy Explorers (IPA Central)',
    memberSummary: '45/100',
    location: 'North Block',
    lastMessage: 'David: That IPA you recommended was incredible. Cheers!',
    timeLabel: 'Oct 24',
    tags: ['#ipa', '#craftbeer'],
    avatarUrls: [_avatarMarcus],
    extraMemberCount: 42,
    trailingIcon: Icons.done_all,
  ),
  GroupchatRoomSummary(
    roomId: 'mock-room-5',
    title: 'Weekly Tastings & Photos',
    memberSummary: '24/30',
    location: 'Eastside',
    lastMessage: 'Jasmine: Sent a photo',
    timeLabel: 'Oct 22',
    tags: ['#photography', '#events'],
    avatarUrls: [_avatarElena],
    extraMemberCount: 22,
    trailingIcon: Icons.image,
  ),
];

const mockGroupchatMessages = [
  GroupchatMessage(
    messageId: 'mock-msg-1',
    roomId: 'mock-room-1',
    sequenceNo: 1,
    kind: GroupchatMessageKind.incoming,
    senderName: 'Marcus',
    senderAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAQyTCxVcaGae2XXiYc9clNsknzexQFUIJw4IIz-bVloxtDRPpP7ObGPHI55cbImyOzIURpuVZvOOCFKKdjejR-mMYFdU2coOwbogNYQegERt-IKDEBAAgDKM3pcI5LbeleKiLSHXwFGunfBTxkbvD1mTCfaKB_8XwiyXzaSVnoE9HBctIX6Met6ui0PxjnRGG0qHKNoMFz_8Rj2uaurIfu4Xz0uhDVppeB6VBQqk6lj2gZbx0zk8oLvtDoEbZxe3sH2OrGjAFwAYM',
    text: 'Found that limited batch at the corner shop!',
    timeLabel: '10:24 AM',
  ),
  GroupchatMessage(
    messageId: 'mock-msg-2',
    roomId: 'mock-room-1',
    sequenceNo: 2,
    kind: GroupchatMessageKind.outgoing,
    text: "Nice! Is there any left? I'm heading over now.",
    timeLabel: '10:25 AM',
    deliveryLabel: 'Delivered',
  ),
  GroupchatMessage(
    messageId: 'mock-msg-3',
    roomId: 'mock-room-1',
    sequenceNo: 3,
    kind: GroupchatMessageKind.incoming,
    senderName: 'Sarah',
    senderAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAwyCeyoBVoRJC2zf3eegEofu4Ru7FbX3PlX7UyNiwprPaUqcBV7_uvKhZBnGw8bqZ6c2dZmW663KVHvlHH2kEcKnp67_TvbLaclCqj2SEOdQdBTeqmFyTZxv2d9nHAz2a13uDjn8Dub7BphKighs55MT82O6DJd0gQAlUi2M7_9OD2AcO2ggnRAS4mLpPJqiSWbmP-ekqbxdNAzTKkVT6RYQsmMId0aTrGbkv_Clg9f2n1GF-8Il9LpMkO_EhFPO-ec_gCDp7OwpI',
    text: 'I grabbed two bottles. There were 5 left as of 10 mins ago.',
    timeLabel: '10:29 AM',
  ),
];

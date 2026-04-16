import '../models/home_models.dart';

const mockHomeHero = HomeHero(
  badge: 'Featured Tasting',
  title: 'The Golden Old Fashioned',
  taste: 'Smoked Oak, Maple',
  smell: 'Orange Peel, Vanilla',
  imageUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDejYsKmxqdf4WzT7yUHoWwf5zE_QEFj7fDJknfA4ulsiOIo6zur9xoWdcmpTxxAExD5CPnJqwsZcWkASC375vqKGGbHNbRzL8hGNNvnFtPqS2UfCyKXE3WpasSQ9ue8D-GcUAGtVSgra0k9UNipn4Iqemls4FXtOc8XHHM0N7Q0ifLVCmCpdoeZZ-Nwj-PvAaZ6Lih9pjucpR4yfKkg8qGsW1-Fy0a4kSLj9jEu0mlYgM5LidqlKgSVZk2-4S5R05sqU9t0w-9-VY',
);

const mockHomeCategories = [
  'All Collections',
  'Bourbon',
  'Craft Gin',
  'Single Malt',
  'Sake',
];

const mockLocalEstablishments = [
  LocalEstablishment(
    name: 'The Oak & Barrel',
    distance: '0.8 miles away',
    category: 'Craft Cocktails',
    rating: '4.9',
    closingTime: 'Closes 2AM',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDFT7FroNpETPKwxMc5DI_UnfnLU-y2lcBPnoS7NXMpJRPjHeBIiOAh1gw9jmOlRBBNM9fYPtngjCxcqy1qFeLHGvJUfo9E_kl1z609ipXH5niJ08jF1GkRkmDeC_IRc-KbvJlTfpRZimIotgmNNWPjdw_8dCpHUqUzQ6d6aOZf3JNYiEcfAv2xWMgFGiJOZgYkv88s8u4M7f4olG2wNaDTB3klXBGUgNpmUTnjb2KUc16Wcq-4RzJEYmyVxsBUS_qluQUjCtg7fDs',
  ),
  LocalEstablishment(
    name: 'Juniper Boutique',
    distance: '1.2 miles away',
    category: 'Rare Finds',
    rating: '4.7',
    closingTime: 'Closes 10PM',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCogrP8y_6Oqj6bLFfFjQ_MPj10pbbb4sXrJA9KrCr_opU_8NsDIIkZ3wEoGlDduX3W65ExI2xDa7XYJ3VlNnC9GTJlrnZcs44RrFOj-ydsSw4vjDh8FY5pwkrdbmvXFHVOk_UByFe8DO_nOTFWYt8mfMmHTba278trY0a37elCvVJx3nhjp3IUNPgsyGECGjxe8pxftfsUsJ2kzX-ocOFQI3XlxwSPvJKSaa8DxoEpvszpbPz561a2wZBcPaPuQH7NsQ_RTO75tkA',
  ),
];

const mockOutdoorVaults = [
  OutdoorVault(
    name: 'The Terrace Vault',
    location: 'Downtown Plaza',
    status: '4 Spots left',
    actionLabel: 'Book Now',
    isPrimaryAction: true,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDmeI8H2F1msUJ3vsnhODBFWz1c2L7iOHQYSQdziGF2LGFJ3xWT7reEu5lsesFtekT5nPXr0VJA072BJAGms3tvAZmHZUqDgoCGlheQX7vhCqcLSKEfTtdVb7FleR24OxNHnxBOWlQdkerHPkh-KvLdJoFVCdjLlpX71KDhIS6-AIKHk--ASYysoC1oIz1b7UFISartn5XT-301MZs_q4pb-LRAvsFzPgqtKmFL58pufv4Iv3SgWXo6W-IbfnL-WN3OrTQQz9q1vKw',
  ),
  OutdoorVault(
    name: 'Garden Hideout',
    location: 'North Hills',
    status: 'Limited',
    actionLabel: 'Waitlist',
    isPrimaryAction: false,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAT4SEN7qZg1-nHF6EoPfbnGNADhHeJGT0WxHE43aXc5oatkoJU-n5n2RmDP-z3lRaXhHMOgCBsMjRSV8VWAfnTAywuyNsJzWVi1Kq-POu2IolkEStYqu7yoT50sVv-8ynNtGxxJazBTtMkt_DQ4-1-jp-9iCAgw-yaSrqyq-kZzxYYA2RaHvrStsupog-WAM2VXZZSCv2R6fFIIHQuPpktD3AGQ6fu96f-lFZxqDPD1iMVjLOZn7dzNdnsrEAbYHNln8B3-AX75oMA',
  ),
];

const mockNeighborhoodPost = NeighborhoodPost(
  author: 'Sarah Jenkins',
  meta: '24 mins ago - The Oak & Barrel',
  body:
      '"Just tried the Golden Old Fashioned feature. The maple notes are incredible. Highly recommend if you are in the neighborhood tonight."',
  tags: ['#LimitedRelease', '#MustTry'],
  avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDGjRrgLl3AU-97avQJtcPUIB9xgxJl3DB51yeftvzFFnbprCdDnxosefJ5AbdjD-Czcu_twgmstNBV1z0hBaF-fyvBiiKy2NKX7oQyWxY5yyczTFUEGaDrEt0PR4UIlWdT66KF_aZ45a49vem3VT_N5z3mE6xFzlNmj3KrLKVsJ876Uj_BGf3DypT3uqcd13vPGlVD4ejTAfowTRD9A5AEY9zaxs_TNmz7omD9Y_BRlAnoikfoUEqWCQNS07UarcN4VY2ZIyaU0Sc',
);

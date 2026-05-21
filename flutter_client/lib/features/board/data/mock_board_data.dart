import '../models/board_models.dart';

const mockBoardCategories = [
  '#AllPosts',
  '#TastingNotes',
  '#Questions',
  '#NearbyDrops',
  '#Events',
  '#TradeBoard',
];

final mockBoardPosts = [
  BoardPost(
    postId: 'mock-1',
    boardType: 'BOARD_TYPE_INFO',
    authorId: 'user-1',
    authorNickname: 'WhiskyWizard',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDtWhkWW2fEDphazGCI1UfA34SjfTVCnVOKVCsaQLo_XwcM7tKg3YIFBIKNMKSL1JVuXg44Eb_Om3fYMhrQVJhmc26L81l1CDcUaGICKFKwV5tHP96Cs3K2974KVHY-HkPp-9B8BgFIIWFnYo0bZWHmiWvm44xvghOYcH-2-w1hqqTqB_g_7caHh5jMSvVTjEqv-TsdZkn_h9WKJyUKKpBqmvOT39vEa9nmdmB9MRXdUCjBQOM4QS_MfdtYKN5Dy7qa5K462dS3ORw',
    title: 'Hidden Gem: Old Soul Cask Strength Batch #4',
    content:
        "Just cracked this open. The nose is heavy on burnt orange peel and vanilla bean. On the palate, it's surprisingly oily with a finish that lasts minutes...",
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAnxWrLekV2XF-PGT9u8UCFhqLvWjW2zb81z9OsWmHyYOA54dvcM8UFXcGJZixM3-KTeuzv5frVPz3Uepm2jAD7tq0qPlAURsZjLWJGizGolgmFhPBlOvhS3UplLhXxq0_DjYxsEjVmJaojJXxO83AXkAitYtRc8wQ47sFOHxNtA6LO9ShHRt9KzMq0CyUhqcQT2qTBAKG-Hv-X4d1eyCL98uPI4iFpNyVmfKYZQPJnEMmQO9Gc7Ka0voGFbNa7OdfluQrn-ZEknls'
    ],
    likeCount: 48,
    viewCount: 120,
    commentCount: 12,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 12, 8, 0),
    updatedAt: DateTime(2025, 5, 12, 8, 0),
    category: 'Tasting Note',
    body:
        "Just cracked this open. The nose is heavy on burnt orange peel and vanilla bean. On the palate, it's surprisingly oily with a finish that lasts minutes...",
    author: 'WhiskyWizard',
    timeAgo: '2h ago',
    favoriteCount: 48,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAnxWrLekV2XF-PGT9u8UCFhqLvWjW2zb81z9OsWmHyYOA54dvcM8UFXcGJZixM3-KTeuzv5frVPz3Uepm2jAD7tq0qPlAURsZjLWJGizGolgmFhPBlOvhS3UplLhXxq0_DjYxsEjVmJaojJXxO83AXkAitYtRc8wQ47sFOHxNtA6LO9ShHRt9KzMq0CyUhqcQT2qTBAKG-Hv-X4d1eyCL98uPI4iFpNyVmfKYZQPJnEMmQO9Gc7Ka0voGFbNa7OdfluQrn-ZEknls',
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDtWhkWW2fEDphazGCI1UfA34SjfTVCnVOKVCsaQLo_XwcM7tKg3YIFBIKNMKSL1JVuXg44Eb_Om3fYMhrQVJhmc26L81l1CDcUaGICKFKwV5tHP96Cs3K2974KVHY-HkPp-9B8BgFIIWFnYo0bZWHmiWvm44xvghOYcH-2-w1hqqTqB_g_7caHh5jMSvVTjEqv-TsdZkn_h9WKJyUKKpBqmvOT39vEa9nmdmB9MRXdUCjBQOM4QS_MfdtYKN5Dy7qa5K462dS3ORw',
  ),
  BoardPost(
    postId: 'mock-2',
    boardType: 'BOARD_TYPE_FREE',
    authorId: 'user-2',
    authorNickname: 'PeatSeeker92',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA0QrnKiNBvp_IicrdkXM5x7eVVlpFjZG2LzW9dnh-y5U8L2bp_D85CARz-qHqY3wGaUhoaKMROCkSuMcE3MJ4YnhD70_p1Ex4Wsilh1uAH189zMbwaG29kvfSDavz1UsvaG_VHdhobQNbrLuAXkY9P3vyB6xFzGc6ttWdWg6oRWURO-FHiB8DlWvUNsNL3nldeuCkWxQ7_5IS2jXs_gaAS2z9E4m7tdgssoTwAtCVnZ9CpWiuvYZC4lokeWTEdJsTlA9ZpXOwz5dg',
    title: 'Looking for a recommendation: Peated scotch under \$100?',
    content:
        "I've usually stuck to Speyside, but I'm looking to venture into Islay territory. Is Laphroaig 10 the standard go-to or should I try something else for a beginner?",
    imageUrls: [],
    likeCount: 21,
    viewCount: 80,
    commentCount: 34,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 12, 6, 0),
    updatedAt: DateTime(2025, 5, 12, 6, 0),
    category: 'Question',
    body:
        "I've usually stuck to Speyside, but I'm looking to venture into Islay territory. Is Laphroaig 10 the standard go-to or should I try something else for a beginner?",
    author: 'PeatSeeker92',
    timeAgo: '4h ago',
    favoriteCount: 21,
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA0QrnKiNBvp_IicrdkXM5x7eVVlpFjZG2LzW9dnh-y5U8L2bp_D85CARz-qHqY3wGaUhoaKMROCkSuMcE3MJ4YnhD70_p1Ex4Wsilh1uAH189zMbwaG29kvfSDavz1UsvaG_VHdhobQNbrLuAXkY9P3vyB6xFzGc6ttWdWg6oRWURO-FHiB8DlWvUNsNL3nldeuCkWxQ7_5IS2jXs_gaAS2z9E4m7tdgssoTwAtCVnZ9CpWiuvYZC4lokeWTEdJsTlA9ZpXOwz5dg',
  ),
  BoardPost(
    postId: 'mock-3',
    boardType: 'BOARD_TYPE_FLASH_MEETUP',
    authorId: 'user-3',
    authorNickname: 'BottleHunter',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuB63IC0ZuFF_pCyVtPPDO5QHDdrywyTiTs2b8cWNPeeDyIAEcRBRNyIAn5rFn9t0hnRxSCoCEun3pQmOPOEIdercKJvRm7OlkdZLKPnpuWUHyxoqseHri_EDwfxHCG3p3_Nc8BaG6H8OcYBssGnG6jIsB_96orEKkJz6y_B_FusvQNZK34toTH8KI29DU2w-kvT9QK9bM3wAN_xZkwLh3kxZ7kYk7LJkA4H6iU6fSZYJzJFkvSWmVUEl7u2UNrLPPiDyOvsn18x5G8',
    title: "Spotted: Blanton's Gold at 4th St Liquors",
    content:
        'Just walked by and they have 3 bottles of Gold on the shelf for MSRP. Limit one per customer. Get there fast!',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBXiTFz9CD2Ky3v_x976b85EAO18wu2IUr3cmjv26JDfcPp5NBeJunO37o4LuuFvPLJmn1XIL68fNp9qX-CDgFAk7vGv8TXVNOqpgQPK_Qng6WZjRQlzaUTSK5uad0DvsfiHoE_sCm1L4kIAxzAIQYq_IQXuNofgJkHuYSt3wHKVwESqT25tLaXpBCKnfNoFoTJeFia5ILAuJ5mIQt3Ge2CN0zXulLcFge_UR-m-giFV4yxwdeKSE7aNPC5fBuLepf5380HjWNcMrg'
    ],
    likeCount: 156,
    viewCount: 300,
    commentCount: 8,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 12, 9, 45),
    updatedAt: DateTime(2025, 5, 12, 9, 45),
    location: BoardLocation(
      name: 'Downtown District',
      address: '4th St Liquors',
      latitude: 0,
      longitude: 0,
    ),
    category: 'Nearby Drop',
    body:
        'Just walked by and they have 3 bottles of Gold on the shelf for MSRP. Limit one per customer. Get there fast!',
    author: 'BottleHunter',
    timeAgo: '15m ago',
    favoriteCount: 156,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBXiTFz9CD2Ky3v_x976b85EAO18wu2IUr3cmjv26JDfcPp5NBeJunO37o4LuuFvPLJmn1XIL68fNp9qX-CDgFAk7vGv8TXVNOqpgQPK_Qng6WZjRQlzaUTSK5uad0DvsfiHoE_sCm1L4kIAxzAIQYq_IQXuNofgJkHuYSt3wHKVwESqT25tLaXpBCKnfNoFoTJeFia5ILAuJ5mIQt3Ge2CN0zXulLcFge_UR-m-giFV4yxwdeKSE7aNPC5fBuLepf5380HjWNcMrg',
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuB63IC0ZuFF_pCyVtPPDO5QHDdrywyTiTs2b8cWNPeeDyIAEcRBRNyIAn5rFn9t0hnRxSCoCEun3pQmOPOEIdercKJvRm7OlkdZLKPnpuWUHyxoqseHri_EDwfxHCG3p3_Nc8BaG6H8OcYBssGnG6jIsB_96orEKkJz6y_B_FusvQNZK34toTH8KI29DU2w-kvT9QK9bM3wAN_xZkwLh3kxZ7kYk7LJkA4H6iU6fSZYJzJFkvSWmVUEl7u2UNrLPPiDyOvsn18x5G8',
  ),
  BoardPost(
    postId: 'mock-4',
    boardType: 'BOARD_TYPE_INFO',
    authorId: 'user-4',
    authorNickname: 'AgaveGal',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBxH4dfKgZBYlFrtruee2rNDgnmusQFxSIti5oyJxdsPJUZjZupOjxJ5_r_XnyPpSp6EINzUp3uVLIg23kWKtxf32OeWpR_hsJ8meecv4ZumTZR7Av4646RNk0lfGhnPOKt_F-KuD4APRufdLi0g9OTrfwO3ceXrM7RL__WttWkb9oPhWleAzcxDmeHtx3d4vrCmVSPhq-TW7iuIRFS08gwkGwBc-Jdcobgs9V5qcprXM9wAJXe3-7IhDUYEaTXUw9rRGygJO5AKj8',
    title: 'Tequila Tuesday: Fortaleza Reposado',
    content:
        'The hype is real. Notes of cooked agave, butter, and a slight vegetal pepperiness. It is remarkably clean and structured. If you see it, buy it.',
    imageUrls: [],
    likeCount: 92,
    viewCount: 200,
    commentCount: 15,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 12, 4, 0),
    updatedAt: DateTime(2025, 5, 12, 4, 0),
    category: 'Tasting Note',
    body:
        'The hype is real. Notes of cooked agave, butter, and a slight vegetal pepperiness. It is remarkably clean and structured. If you see it, buy it.',
    author: 'AgaveGal',
    timeAgo: '6h ago',
    favoriteCount: 92,
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBxH4dfKgZBYlFrtruee2rNDgnmusQFxSIti5oyJxdsPJUZjZupOjxJ5_r_XnyPpSp6EINzUp3uVLIg23kWKtxf32OeWpR_hsJ8meecv4ZumTZR7Av4646RNk0lfGhnPOKt_F-KuD4APRufdLi0g9OTrfwO3ceXrM7RL__WttWkb9oPhWleAzcxDmeHtx3d4vrCmVSPhq-TW7iuIRFS08gwkGwBc-Jdcobgs9V5qcprXM9wAJXe3-7IhDUYEaTXUw9rRGygJO5AKj8',
  ),
  BoardPost(
    postId: 'mock-5',
    boardType: 'BOARD_TYPE_FLASH_MEETUP',
    authorId: 'user-5',
    authorNickname: 'GinGenius',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA9ans6MvyOREsXYeZhd5x4vJ4G0-0ShILt6N9SVoK5yDz0AEVyh1INKM9PE2wXTxpjnKMKA7Ca0cdbFy3jRQ7JT8oBi5ffnckNbh0H-QWu9KK7dmuDjYCBAsuPWuah6Gd7-MEAJpHv3nTem-Umf1z3e7JvQAjLKmW-a5XZuDi9TgLomOAC4A7M4_PMSpcVIso7OCKNVReY3o3CzLQRZ3-4FY6_km2FnhHJCLfMgL8webMBTS9MRQvrB4aBu3v3yqyP_1zENFB4b6c',
    title: 'New Local Gin Release',
    content:
        'The distillery on 5th just released their botanical spring batch. Heavy on the lavender and grapefruit. Limited to 200 bottles.',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuA-7Jd-yuFH3SaHtAk0Muu2-rUmaT8xYANLhN0dryWrbHyHnG5c8-aOwi4idKQ9TYhhqOzbAuYswBUgN4dZBGVfP3xrLn3GzlUbFar2y0X9_4aFGg4Q-svBPG8rv58Jay4EucR2v-CnXojSP5dDweeRiRQS5bQ5GXHZHAMKqBmPCyzd9KiWEdffp5cQv8TnxYarSzb3R1oTdLNzph_WRZnmwF7J9BvB3vSftYBByqwIjqvte5xR9TN9iguzzgL34Q1t_JychzacibE'
    ],
    likeCount: 31,
    viewCount: 90,
    commentCount: 5,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 12, 2, 0),
    updatedAt: DateTime(2025, 5, 12, 2, 0),
    location: BoardLocation(
      name: 'Westside Artisan Hub',
      address: '5th St Distillery',
      latitude: 0,
      longitude: 0,
    ),
    category: 'Nearby Drop',
    body:
        'The distillery on 5th just released their botanical spring batch. Heavy on the lavender and grapefruit. Limited to 200 bottles.',
    author: 'GinGenius',
    timeAgo: '8h ago',
    favoriteCount: 31,
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA-7Jd-yuFH3SaHtAk0Muu2-rUmaT8xYANLhN0dryWrbHyHnG5c8-aOwi4idKQ9TYhhqOzbAuYswBUgN4dZBGVfP3xrLn3GzlUbFar2y0X9_4aFGg4Q-svBPG8rv58Jay4EucR2v-CnXojSP5dDweeRiRQS5bQ5GXHZHAMKqBmPCyzd9KiWEdffp5cQv8TnxYarSzb3R1oTdLNzph_WRZnmwF7J9BvB3vSftYBByqwIjqvte5xR9TN9iguzzgL34Q1t_JychzacibE',
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA9ans6MvyOREsXYeZhd5x4vJ4G0-0ShILt6N9SVoK5yDz0AEVyh1INKM9PE2wXTxpjnKMKA7Ca0cdbFy3jRQ7JT8oBi5ffnckNbh0H-QWu9KK7dmuDjYCBAsuPWuah6Gd7-MEAJpHv3nTem-Umf1z3e7JvQAjLKmW-a5XZuDi9TgLomOAC4A7M4_PMSpcVIso7OCKNVReY3o3CzLQRZ3-4FY6_km2FnhHJCLfMgL8webMBTS9MRQvrB4aBu3v3yqyP_1zENFB4b6c',
  ),
  BoardPost(
    postId: 'mock-6',
    boardType: 'BOARD_TYPE_FREE',
    authorId: 'user-6',
    authorNickname: 'MartiniMike',
    authorProfileImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuC-RNB5a3SZ1inLJYhS1HS7vKH_2y3Gx9kRV6NA62rQNpDZIym1OKCFbbj-jP13iyqkzxWHxFfxT3sHalL1SsgkFI4CJUwv6lW8S8Q4aIfSNn4xPRjnRnlXfX-LTic21bARbbgawVruNOrRSH_Xc3W_biUzZ_L4q2Mx8Lahi-zjwfLqNWnjIBmSDwZ8NIMFTr7XaJg8pC_tnv8BlxNjThKhA_vo_IYEBDiE0hUEVH7flGtfhDQPCSQerTfplHA5OAxw7cw-Qpj-CQc',
    title: 'Shelf life of Vermouth?',
    content:
        'I keep my Carpano Antica on the shelf but someone told me it belongs in the fridge. Does it actually matter if I finish it in a month?',
    imageUrls: [],
    likeCount: 18,
    viewCount: 150,
    commentCount: 42,
    isNotice: false,
    isLiked: false,
    createdAt: DateTime(2025, 5, 11, 10, 0),
    updatedAt: DateTime(2025, 5, 11, 10, 0),
    category: 'Question',
    body:
        'I keep my Carpano Antica on the shelf but someone told me it belongs in the fridge. Does it actually matter if I finish it in a month?',
    author: 'MartiniMike',
    timeAgo: '1d ago',
    favoriteCount: 18,
    authorAvatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuC-RNB5a3SZ1inLJYhS1HS7vKH_2y3Gx9kRV6NA62rQNpDZIym1OKCFbbj-jP13iyqkzxWHxFfxT3sHalL1SsgkFI4CJUwv6lW8S8Q4aIfSNn4xPRjnRnlXfX-LTic21bARbbgawVruNOrRSH_Xc3W_biUzZ_L4q2Mx8Lahi-zjwfLqNWnjIBmSDwZ8NIMFTr7XaJg8pC_tnv8BlxNjThKhA_vo_IYEBDiE0hUEVH7flGtfhDQPCSQerTfplHA5OAxw7cw-Qpj-CQc',
  ),
];

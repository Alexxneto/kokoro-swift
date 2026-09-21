// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Kokoro",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "Kokoro", targets: ["Kokoro"]),
        .executable(name: "KokoroCLI", targets: ["KokoroCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alexxneto/misaki-swift.git", from: "1.0.0"),
        .package(url: "https://github.com/ml-explore/mlx-swift.git", exact: "0.31.3")
    ],
    targets: [
        .target(
            name: "Kokoro",
            dependencies: [
                .product(name: "Misaki", package: "misaki-swift"),
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXFast", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
            ]
        ),
        .executableTarget(
            name: "KokoroCLI",
            dependencies: ["Kokoro"]
        ),
        .testTarget(
            name: "KokoroTests",
            dependencies: [
                "Kokoro",
                .product(name: "Misaki", package: "misaki-swift"),
            ]
        ),
    ]
)

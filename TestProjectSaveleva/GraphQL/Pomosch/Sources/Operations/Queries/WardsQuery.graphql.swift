// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsQuery: GraphQLQuery {
  public static let operationName: String = "Wards"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Wards($first: Int, $after: String, $order: [WardSortInput!]) { wards(first: $first, after: $after, order: $order) { __typename pageInfo { __typename endCursor hasNextPage } nodes { __typename publicInformation { __typename name { __typename displayName } photo { __typename url(variant: "small") } } } } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var after: GraphQLNullable<String>
  public var order: GraphQLNullable<[WardSortInput]>

  public init(
    first: GraphQLNullable<Int>,
    after: GraphQLNullable<String>,
    order: GraphQLNullable<[WardSortInput]>
  ) {
    self.first = first
    self.after = after
    self.order = order
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after,
    "order": order
  ] }

  public struct Data: Pomosch.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wards", Wards?.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after"),
        "order": .variable("order")
      ]),
    ] }

    /// Подопечные
    public var wards: Wards? { __data["wards"] }

    /// Wards
    ///
    /// Parent Type: `WardsConnection`
    public struct Wards: Pomosch.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.WardsConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pageInfo", PageInfo.self),
        .field("nodes", [Node]?.self),
      ] }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }
      /// A flattened list of the nodes.
      public var nodes: [Node]? { __data["nodes"] }

      /// Wards.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: Pomosch.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("endCursor", String?.self),
          .field("hasNextPage", Bool.self),
        ] }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? { __data["endCursor"] }
        /// Indicates whether more edges exist following the set defined by the clients arguments.
        public var hasNextPage: Bool { __data["hasNextPage"] }
      }

      /// Wards.Node
      ///
      /// Parent Type: `Ward`
      public struct Node: Pomosch.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.Ward }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("publicInformation", PublicInformation.self),
        ] }

        /// Общедоступная информация о подопечном
        public var publicInformation: PublicInformation { __data["publicInformation"] }

        /// Wards.Node.PublicInformation
        ///
        /// Parent Type: `WardPublicInformation`
        public struct PublicInformation: Pomosch.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.WardPublicInformation }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", Name.self),
            .field("photo", Photo.self),
          ] }

          /// Имя
          public var name: Name { __data["name"] }
          /// Фотография подопечного
          public var photo: Photo { __data["photo"] }

          /// Wards.Node.PublicInformation.Name
          ///
          /// Parent Type: `Nomen`
          public struct Name: Pomosch.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.Nomen }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("displayName", String.self),
            ] }

            /// Имя для отображения (Имя Фамилия)
            public var displayName: String { __data["displayName"] }
          }

          /// Wards.Node.PublicInformation.Photo
          ///
          /// Parent Type: `FileInformation`
          public struct Photo: Pomosch.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Pomosch.Objects.FileInformation }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", String.self, arguments: ["variant": "small"]),
            ] }

            /// Ссылка для отображения или скачивания файла
            public var url: String { __data["url"] }
          }
        }
      }
    }
  }
}

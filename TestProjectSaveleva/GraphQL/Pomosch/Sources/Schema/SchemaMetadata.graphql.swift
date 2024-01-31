// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Pomosch.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Pomosch.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Pomosch.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Pomosch.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return Pomosch.Objects.Query
    case "WardsConnection": return Pomosch.Objects.WardsConnection
    case "PageInfo": return Pomosch.Objects.PageInfo
    case "Ward": return Pomosch.Objects.Ward
    case "WardPublicInformation": return Pomosch.Objects.WardPublicInformation
    case "Nomen": return Pomosch.Objects.Nomen
    case "FileInformation": return Pomosch.Objects.FileInformation
    case "FileUploadInformation": return Pomosch.Objects.FileUploadInformation
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}

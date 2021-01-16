//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//
import Foundation

class DAAlbumList: DAAPIBaseRequestResponse {
    
    override func route() -> String {
        return "/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
    }
        
    override func parseResponse(response: Any?) -> Any? {
        guard let jsonResult = response as? JSONDictAny else { return nil }
        return Welcome.decode(data: jsonResult.dataWithJSONObject())
    }
}

// MARK: - Welcome
struct Welcome: Codable {
    var feed: Feed?
        
    private enum CodingKeys: String, CodingKey {
        case feed
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            feed = (try? values.decode(Feed.self, forKey: .feed)) ?? nil
        } catch {}
    }
}

// MARK: - Feed
struct Feed: Codable {
    var author: Author?
    var entry: [Entry]?
    var updated, rights, title, icon: Icon?
    var link: [IMCollectionLink]?
    var id: Icon?
    
    private enum CodingKeys: String, CodingKey {
        case author, entry, updated, rights, title
        case icon, link, id
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            author = (try? values.decode(Author.self, forKey: .author)) ?? nil
            entry = (try? values.decode([Entry].self, forKey: .entry)) ?? []
            updated = (try? values.decode(Icon.self, forKey: .updated)) ?? nil
            rights = (try? values.decode(Icon.self, forKey: .rights)) ?? nil
            title = (try? values.decode(Icon.self, forKey: .title)) ?? nil
            icon = (try? values.decode(Icon.self, forKey: .icon)) ?? nil
            link = (try? values.decode([IMCollectionLink].self, forKey: .link)) ?? []
            id = (try? values.decode(Icon.self, forKey: .id)) ?? nil
        } catch {}
    }
}

// MARK: - Author
struct Author: Codable {
    var name, uri: Icon?
    
    private enum CodingKeys: String, CodingKey {
        case name, uri
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = (try? values.decode(Icon.self, forKey: .name)) ?? nil
            uri = (try? values.decode(Icon.self, forKey: .uri)) ?? nil
        } catch {}
    }
}

// MARK: - Icon
struct Icon: Codable {
    var label: String?
    
    private enum CodingKeys: String, CodingKey {
        case label
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = (try? values.decode(String.self, forKey: .label)) ?? ""
        } catch {}
    }
}

// MARK: - Entry
struct Entry: Codable {
    var imName: Icon?
    var imImage: [IMImage]?
    var imCollection: IMCollection?
    var imPrice: IMPrice?
    var imContentType: IMCollectionIMContentType?
    var rights, title: Icon?
    var link: [EntryLink]?
    var id: ID?
    var imArtist: IMArtist?
    var category: Category?
    var imReleaseDate: IMReleaseDate?

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case imCollection = "im:collection"
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights, title, link, id
        case imArtist = "im:artist"
        case category
        case imReleaseDate = "im:releaseDate"
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            imName = (try? values.decode(Icon.self, forKey: .imName)) ?? nil
            imImage = (try? values.decode([IMImage].self, forKey: .imImage)) ?? []
            imCollection = (try? values.decode(IMCollection.self, forKey: .imCollection)) ?? nil
            imPrice = (try? values.decode(IMPrice.self, forKey: .imPrice)) ?? nil
            imContentType = (try? values.decode(IMCollectionIMContentType.self, forKey: .imContentType)) ?? nil
            rights = (try? values.decode(Icon.self, forKey: .rights)) ?? nil
            title = (try? values.decode(Icon.self, forKey: .title)) ?? nil
            link = (try? values.decode([EntryLink].self, forKey: .link)) ?? []
            id = (try? values.decode(ID.self, forKey: .id)) ?? nil
            imArtist = (try? values.decode(IMArtist.self, forKey: .imArtist)) ?? nil
            category = (try? values.decode(Category.self, forKey: .category)) ?? nil
            imReleaseDate = (try? values.decode(IMReleaseDate.self, forKey: .imReleaseDate)) ?? nil
        } catch {}
    }
}

// MARK: - Category
struct Category: Codable {
    var attributes: CategoryAttributes?
    enum CodingKeys: String, CodingKey {
        case attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            attributes = (try? values.decode(CategoryAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Codable {
    var imID, term: String?
    var scheme: String?
    var label: String?

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case term, scheme, label
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            imID = (try? values.decode(String.self, forKey: .imID)) ?? ""
            term = (try? values.decode(String.self, forKey: .term)) ?? ""
            scheme = (try? values.decode(String.self, forKey: .scheme)) ?? ""
            label = (try? values.decode(String.self, forKey: .label)) ?? ""
        } catch {}
    }
}

// MARK: - ID
struct ID: Codable {
    var label: String?
    var attributes: IDAttributes?
    
    enum CodingKeys: String, CodingKey {
        case label, attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = (try? values.decode(String.self, forKey: .label)) ?? ""
            attributes = (try? values.decode(IDAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - IDAttributes
struct IDAttributes: Codable {
    var imID: String?

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            imID = (try? values.decode(String.self, forKey: .imID)) ?? ""
        } catch {}
    }
}

// MARK: - IMArtist
struct IMArtist: Codable {
    var label: String?
    var attributes: IMArtistAttributes?
    
    enum CodingKeys: String, CodingKey {
        case label, attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = (try? values.decode(String.self, forKey: .label)) ?? ""
            attributes = (try? values.decode(IMArtistAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Codable {
    var href: String?
    
    enum CodingKeys: String, CodingKey {
        case href
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            href = (try? values.decode(String.self, forKey: .href)) ?? ""
        } catch {}
    }
}

// MARK: - IMCollection
struct IMCollection: Codable {
    var imName: Icon?
    var link: IMCollectionLink?
    var imContentType: IMCollectionIMContentType?

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case link
        case imContentType = "im:contentType"
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            imName = (try? values.decode(Icon.self, forKey: .imName)) ?? nil
            link = (try? values.decode(IMCollectionLink.self, forKey: .link)) ?? nil
            imContentType = (try? values.decode(IMCollectionIMContentType.self, forKey: .imContentType)) ?? nil
        } catch {}
    }
}

// MARK: - IMCollectionIMContentType
struct IMCollectionIMContentType: Codable {
    var imContentType: IMContentTypeIMContentType?
    var attributes: IMContentTypeAttributes?

    enum CodingKeys: String, CodingKey {
        case imContentType = "im:contentType"
        case attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            imContentType = (try? values.decode(IMContentTypeIMContentType.self, forKey: .imContentType)) ?? nil
            attributes = (try? values.decode(IMContentTypeAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Codable {
    var term, label: TermEnum?
    
    enum CodingKeys: String, CodingKey {
        case term, label
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            term = (try? values.decode(TermEnum.self, forKey: .term)) ?? nil
            label = (try? values.decode(TermEnum.self, forKey: .label)) ?? nil
        } catch {}
    }
}

enum TermEnum: String, Codable {
    case album = "Album"
    case music = "Music"
    case track = "Track"
    
}

// MARK: - IMContentTypeIMContentType
struct IMContentTypeIMContentType: Codable {
    var attributes: IMContentTypeAttributes?
    
    enum CodingKeys: String, CodingKey {
        case attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            attributes = (try? values.decode(IMContentTypeAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - IMCollectionLink
struct IMCollectionLink: Codable {
    var attributes: PurpleAttributes?
    
    enum CodingKeys: String, CodingKey {
        case attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            attributes = (try? values.decode(PurpleAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Codable {
    var rel: PurpleRel?
    var type: TypeEnum?
    var href: String?
    
    enum CodingKeys: String, CodingKey {
        case rel, type, href
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            rel = (try? values.decode(PurpleRel.self, forKey: .rel)) ?? nil
            type = (try? values.decode(TypeEnum.self, forKey: .type)) ?? nil
            href = (try? values.decode(String.self, forKey: .href)) ?? ""
        } catch {}
    }
}

enum PurpleRel: String, Codable {
    case alternate = "alternate"
    case relSelf = "self"
}

enum TypeEnum: String, Codable {
    case audioXM4A = "audio/x-m4a"
    case textHTML = "text/html"
}

// MARK: - IMImage
struct IMImage: Codable {
    var label: String?
    var attributes: IMImageAttributes?
    
    enum CodingKeys: String, CodingKey {
        case label, attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            attributes = (try? values.decode(IMImageAttributes.self, forKey: .attributes)) ?? nil
            label = (try? values.decode(String.self, forKey: .label)) ?? ""
        } catch {}
    }
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Codable {
    var height: String?
    
    enum CodingKeys: String, CodingKey {
        case height
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            height = (try? values.decode(String.self, forKey: .height)) ?? ""
        } catch {}
    }
}

// MARK: - IMPrice
struct IMPrice: Codable {
    var label: IMPriceLabel?
    var attributes: IMPriceAttributes?
    
    enum CodingKeys: String, CodingKey {
        case label, attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = (try? values.decode(IMPriceLabel.self, forKey: .label)) ?? nil
            attributes = (try? values.decode(IMPriceAttributes.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Codable {
    var amount: String?
    var currency: Currency?
    
    enum CodingKeys: String, CodingKey {
        case amount, currency
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            amount = (try? values.decode(String.self, forKey: .amount)) ?? ""
            currency = (try? values.decode(Currency.self, forKey: .currency)) ?? nil
        } catch {}
    }
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum IMPriceLabel: String, Codable {
    case the069 = "$0.69"
    case the099 = "$0.99"
    case the129 = "$1.29"
}

// MARK: - IMReleaseDate
struct IMReleaseDate: Codable {
    var label: Date?
    var attributes: Icon?
    
    enum CodingKeys: String, CodingKey {
        case label, attributes
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = (try? values.decode(Date.self, forKey: .label)) ?? nil
            attributes = (try? values.decode(Icon.self, forKey: .attributes)) ?? nil
        } catch {}
    }
}

// MARK: - EntryLink
struct EntryLink: Codable {
    var attributes: FluffyAttributes?
    var imDuration: Icon?

    enum CodingKeys: String, CodingKey {
        case attributes
        case imDuration = "im:duration"
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            attributes = (try? values.decode(FluffyAttributes.self, forKey: .attributes)) ?? nil
            imDuration = (try? values.decode(Icon.self, forKey: .imDuration)) ?? nil
        } catch {}
    }
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Codable {
    var rel: FluffyRel?
    var type: TypeEnum?
    var href: String?
    var title: Title?
    var imAssetType: IMAssetType?

    enum CodingKeys: String, CodingKey {
        case rel, type, href, title
        case imAssetType = "im:assetType"
    }
    
    init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            rel = (try? values.decode(FluffyRel.self, forKey: .rel)) ?? nil
            type = (try? values.decode(TypeEnum.self, forKey: .type)) ?? nil            
            href = (try? values.decode(String.self, forKey: .href)) ?? ""
            title = (try? values.decode(Title.self, forKey: .title)) ?? nil
            imAssetType = (try? values.decode(IMAssetType.self, forKey: .imAssetType)) ?? nil
        } catch {}
    }
}

enum IMAssetType: String, Codable {
    case preview = "preview"
}

enum FluffyRel: String, Codable {
    case alternate = "alternate"
    case enclosure = "enclosure"
}

enum Title: String, Codable {
    case preview = "Preview"
}



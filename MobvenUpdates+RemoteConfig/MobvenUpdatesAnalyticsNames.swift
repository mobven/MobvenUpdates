//
//  MobvenUpdatesAnalyticsNames.swift
//  MobvenUpdates+RemoteConfig
//
//  Created by Rasid Ramazanov on 25.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation
import FirebaseAnalytics

/// Game achievement ID (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterAchievementID : @"10_matches_won",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterAchievementID = AnalyticsParameterAchievementID

/// Ad Network Click ID (NSString). Used for network-specific click IDs which vary in format.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterAdNetworkClickID : @"1234567",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterAdNetworkClickID = AnalyticsParameterAdNetworkClickID

/// The store or affiliation from which this transaction occurred (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterAffiliation : @"Google Store",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterAffiliation = AnalyticsParameterAffiliation

/// The individual campaign name, slogan, promo code, etc. Some networks have pre-defined macro to
/// capture campaign information, otherwise can be populated by developer. Highly Recommended
/// (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCampaign : @"winter_promotion",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCampaign = AnalyticsParameterCampaign

/// Character used in game (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCharacter : @"beat_boss",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCharacter = AnalyticsParameterCharacter

/// The checkout step (1..N) (unsigned 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCheckoutStep : @"1",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCheckoutStep = AnalyticsParameterCheckoutStep

/// Some option on a step in an ecommerce flow (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCheckoutOption : @"Visa",
///       // ...
///     };
/// </pre>

/// Campaign content (NSString).
public let MobvenUpdatesAnalyticsParameterContent = AnalyticsParameterContent

/// Type of content selected (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterContentType : @"news article",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterContentType = AnalyticsParameterContentType

/// Coupon code for a purchasable item (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCoupon : @"zz123",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCoupon = AnalyticsParameterCoupon

/// Campaign custom parameter (NSString). Used as a method of capturing custom data in a campaign.
/// Use varies by network.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCP1 : @"custom_data",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCP1 = AnalyticsParameterCP1

/// The name of a creative used in a promotional spot (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCreativeName : @"Summer Sale",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCreativeName = AnalyticsParameterCreativeName

/// The name of a creative slot (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCreativeSlot : @"summer_banner2",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCreativeSlot = AnalyticsParameterCreativeSlot

/// Purchase currency in 3-letter <a href="http://en.wikipedia.org/wiki/ISO_4217#Active_codes">
/// ISO_4217</a> format (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterCurrency : @"USD",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterCurrency = AnalyticsParameterCurrency

/// Flight or Travel destination (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterDestination : @"Mountain View, CA",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterDestination = AnalyticsParameterDestination

/// The arrival date, check-out date or rental end date for the item. This should be in
/// YYYY-MM-DD format (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterEndDate : @"2015-09-14",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterEndDate = AnalyticsParameterEndDate

/// Flight number for travel events (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterFlightNumber : @"ZZ800",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterFlightNumber = AnalyticsParameterFlightNumber

/// Group/clan/guild ID (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterGroupID : @"g1",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterGroupID = AnalyticsParameterGroupID

/// Index of an item in a list (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterIndex : @(1),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterIndex = AnalyticsParameterIndex

/// Item brand (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemBrand : @"Google",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemBrand = AnalyticsParameterItemBrand

/// Item category (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemCategory : @"t-shirts",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemCategory = AnalyticsParameterItemCategory

/// Item ID (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemID : @"p7654",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemID = AnalyticsParameterItemID

/// The Google <a href="https://developers.google.com/places/place-id">Place ID</a> (NSString) that
/// corresponds to the associated item. Alternatively, you can supply your own custom Location ID.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemLocationID : @"ChIJiyj437sx3YAR9kUWC8QkLzQ",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemLocationID = AnalyticsParameterItemLocationID

/// Item name (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemName : @"abc",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemName = AnalyticsParameterItemName

/// The list in which the item was presented to the user (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemList : @"Search Results",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemList = AnalyticsParameterItemList

/// Item variant (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterItemVariant : @"Red",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterItemVariant = AnalyticsParameterItemVariant

/// Level in game (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterLevel : @(42),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterLevel = AnalyticsParameterLevel

/// Location (NSString). The Google <a href="https://developers.google.com/places/place-id">Place ID
/// </a> that corresponds to the associated event. Alternatively, you can supply your own custom
/// Location ID.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterLocation : @"ChIJiyj437sx3YAR9kUWC8QkLzQ",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterLocation = AnalyticsParameterLocation

/// The advertising or marketing medium, for example: cpc, banner, email, push. Highly recommended
/// (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterMedium : @"email",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterMedium = AnalyticsParameterMedium

/// Number of nights staying at hotel (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterNumberOfNights : @(3),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterNumberOfNights = AnalyticsParameterNumberOfNights

/// Number of passengers traveling (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterNumberOfPassengers : @(11),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterNumberOfPassengers = AnalyticsParameterNumberOfPassengers

/// Number of rooms for travel events (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterNumberOfRooms : @(2),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterNumberOfRooms = AnalyticsParameterNumberOfRooms

/// Flight or Travel origin (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterOrigin : @"Mountain View, CA",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterOrigin = AnalyticsParameterOrigin

/// Purchase price (double as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterPrice : @(1.0),
///       kFIRParameterCurrency : @"USD",  // e.g. $1.00 USD
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterPrice = AnalyticsParameterPrice

/// Purchase quantity (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterQuantity : @(1),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterQuantity = AnalyticsParameterQuantity

/// Score in game (signed 64-bit integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterScore : @(4200),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterScore = AnalyticsParameterScore

/// The search string/keywords used (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterSearchTerm : @"periodic table",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterSearchTerm = AnalyticsParameterSearchTerm

/// Shipping cost (double as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterShipping : @(9.50),
///       kFIRParameterCurrency : @"USD",  // e.g. $9.50 USD
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterShipping = AnalyticsParameterShipping

/// Sign up method (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterSignUpMethod : @"google",
///       // ...
///     };
/// </pre>
///
/// <b>This constant has been deprecated. Use Method constant instead.</b>
public let MobvenUpdatesAnalyticsParameterSignUpMethod = AnalyticsParameterSignUpMethod

/// A particular approach used in an operation; for example, "facebook" or "email" in the context
/// of a sign_up or login event.  (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterMethod : @"google",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterMethod = AnalyticsParameterMethod

/// The origin of your traffic, such as an Ad network (for example, google) or partner (urban
/// airship). Identify the advertiser, site, publication, etc. that is sending traffic to your
/// property. Highly recommended (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterSource : @"InMobi",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterSource = AnalyticsParameterSource

/// The departure date, check-in date or rental start date for the item. This should be in
/// YYYY-MM-DD format (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterStartDate : @"2015-09-14",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterStartDate = AnalyticsParameterStartDate

/// Tax amount (double as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterTax : @(1.0),
///       kFIRParameterCurrency : @"USD",  // e.g. $1.00 USD
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterTax = AnalyticsParameterTax

/// If you're manually tagging keyword campaigns, you should use utm_term to specify the keyword
/// (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterTerm : @"game",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterTerm = AnalyticsParameterTerm

/// A single ID for a ecommerce group transaction (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterTransactionID : @"ab7236dd9823",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterTransactionID = AnalyticsParameterTransactionID

/// Travel class (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterTravelClass : @"business",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterTravelClass = AnalyticsParameterTravelClass

/// A context-specific numeric value which is accumulated automatically for each event type. This is
/// a general purpose parameter that is useful for accumulating a key metric that pertains to an
/// event. Examples include revenue, distance, time and points. Value should be specified as signed
/// 64-bit integer or double as NSNumber. Notes: Values for pre-defined currency-related events
/// (such as @c kFIREventAddToCart) should be supplied using double as NSNumber and must be
/// accompanied by a @c kFIRParameterCurrency parameter. The valid range of accumulated values is
/// [-9,223,372,036,854.77, 9,223,372,036,854.77]. Supplying a non-numeric value, omitting the
/// corresponding @c kFIRParameterCurrency parameter, or supplying an invalid
/// <a href="https://goo.gl/qqX3J2">currency code</a> for conversion events will cause that
/// conversion to be omitted from reporting.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterValue : @(3.99),
///       kFIRParameterCurrency : @"USD",  // e.g. $3.99 USD
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterValue = AnalyticsParameterValue

/// Name of virtual currency type (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterVirtualCurrencyName : @"virtual_currency_name",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterVirtualCurrencyName = AnalyticsParameterVirtualCurrencyName

/// The name of a level in a game (NSString).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterLevelName : @"room_1",
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterLevelName = AnalyticsParameterLevelName

/// The result of an operation. Specify 1 to indicate success and 0 to indicate failure (unsigned
/// integer as NSNumber).
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterSuccess : @(1),
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterSuccess = AnalyticsParameterSuccess

/// Indicates that the associated event should either extend the current session
/// or start a new session if no session was active when the event was logged.
/// Specify YES to extend the current session or to start a new session; any
/// other value will not extend or start a session.
/// <pre>
///     NSDictionary *params = @{
///       kFIRParameterExtendSession : @YES,
///       // ...
///     };
/// </pre>
public let MobvenUpdatesAnalyticsParameterExtendSession = AnalyticsParameterExtendSession

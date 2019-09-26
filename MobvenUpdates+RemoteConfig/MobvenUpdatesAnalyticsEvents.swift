//
//  MobvenUpdatesAnalyticsEvents.swift
//  MobvenUpdates+RemoteConfig
//
//  Created by Rasid Ramazanov on 25.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation
import FirebaseAnalytics

/// Add Payment Info event. This event signifies that a user has submitted their payment information
/// to your app.
public let MobvenUpdatesAnalyticsEventAddPaymentInfo = AnalyticsEventAddPaymentInfo

/// E-Commerce Add To Cart event. This event signifies that an item was added to a cart for
/// purchase. Add this event to a funnel with kFIREventEcommercePurchase to gauge the effectiveness
/// of your checkout process. Note: If you supply the @c kFIRParameterValue parameter, you must
/// also supply the @c kFIRParameterCurrency parameter so that revenue metrics can be computed
/// accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterQuantity (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
///     <li>@c kFIRParameterItemLocationID (NSString) (optional)</li>
///     <li>@c kFIRParameterPrice (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventAddToCart = AnalyticsEventAddToCart

/// E-Commerce Add To Wishlist event. This event signifies that an item was added to a wishlist.
/// Use this event to identify popular gift items in your app. Note: If you supply the
/// @c kFIRParameterValue parameter, you must also supply the @c kFIRParameterCurrency
/// parameter so that revenue metrics can be computed accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterQuantity (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
///     <li>@c kFIRParameterItemLocationID (NSString) (optional)</li>
///     <li>@c kFIRParameterPrice (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventAddToWishlist = AnalyticsEventAddToWishlist

/// App Open event. By logging this event when an App becomes active, developers can understand how
/// often users leave and return during the course of a Session. Although Sessions are automatically
/// reported, this event can provide further clarification around the continuous engagement of
/// app-users.
public let MobvenUpdatesAnalyticsEventAppOpen = AnalyticsEventAppOpen

/// E-Commerce Begin Checkout event. This event signifies that a user has begun the process of
/// checking out. Add this event to a funnel with your kFIREventEcommercePurchase event to gauge the
/// effectiveness of your checkout process. Note: If you supply the @c kFIRParameterValue
/// parameter, you must also supply the @c kFIRParameterCurrency parameter so that revenue
/// metrics can be computed accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterTransactionID (NSString) (optional)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
///     <li>@c kFIRParameterNumberOfNights (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfRooms (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfPassengers (signed 64-bit integer as NSNumber) (optional)
///         for travel bookings</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterTravelClass (NSString) (optional) for travel bookings</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventBeginCheckout = AnalyticsEventBeginCheckout

/// Campaign Detail event. Log this event to supply the referral details of a re-engagement
/// campaign. Note: you must supply at least one of the required parameters kFIRParameterSource,
/// kFIRParameterMedium or kFIRParameterCampaign. Params:
///
/// <ul>
///     <li>@c kFIRParameterSource (NSString)</li>
///     <li>@c kFIRParameterMedium (NSString)</li>
///     <li>@c kFIRParameterCampaign (NSString)</li>
///     <li>@c kFIRParameterTerm (NSString) (optional)</li>
///     <li>@c kFIRParameterContent (NSString) (optional)</li>
///     <li>@c kFIRParameterAdNetworkClickID (NSString) (optional)</li>
///     <li>@c kFIRParameterCP1 (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventCampaignDetails = AnalyticsEventCampaignDetails

/// Checkout progress. Params:
///
/// <ul>
///    <li>@c kFIRParameterCheckoutStep (unsigned 64-bit integer as NSNumber)</li>
///    <li>@c kFIRParameterCheckoutOption (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventCheckoutProgress = AnalyticsEventCheckoutProgress

/// Earn Virtual Currency event. This event tracks the awarding of virtual currency in your app. Log
/// this along with @c kFIREventSpendVirtualCurrency to better understand your virtual economy.
/// Params:
///
/// <ul>
///     <li>@c kFIRParameterVirtualCurrencyName (NSString)</li>
///     <li>@c kFIRParameterValue (signed 64-bit integer or double as NSNumber)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventEarnVirtualCurrency = AnalyticsEventEarnVirtualCurrency

/// E-Commerce Purchase event. This event signifies that an item was purchased by a user. Note:
/// This is different from the in-app purchase event, which is reported automatically for App
/// Store-based apps. Note: If you supply the @c kFIRParameterValue parameter, you must also
/// supply the @c kFIRParameterCurrency parameter so that revenue metrics can be computed
/// accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterTransactionID (NSString) (optional)</li>
///     <li>@c kFIRParameterTax (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterShipping (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCoupon (NSString) (optional)</li>
///     <li>@c kFIRParameterLocation (NSString) (optional)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
///     <li>@c kFIRParameterNumberOfNights (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfRooms (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfPassengers (signed 64-bit integer as NSNumber) (optional)
///         for travel bookings</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterTravelClass (NSString) (optional) for travel bookings</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventEcommercePurchase = AnalyticsEventEcommercePurchase

/// Generate Lead event. Log this event when a lead has been generated in the app to understand the
/// efficacy of your install and re-engagement campaigns. Note: If you supply the
/// @c kFIRParameterValue parameter, you must also supply the @c kFIRParameterCurrency
/// parameter so that revenue metrics can be computed accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventGenerateLead = AnalyticsEventGenerateLead

/// Join Group event. Log this event when a user joins a group such as a guild, team or family. Use
/// this event to analyze how popular certain groups or social features are in your app. Params:
///
/// <ul>
///     <li>@c kFIRParameterGroupID (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventJoinGroup = AnalyticsEventJoinGroup

/// Level Up event. This event signifies that a player has leveled up in your gaming app. It can
/// help you gauge the level distribution of your userbase and help you identify certain levels that
/// are difficult to pass. Params:
///
/// <ul>
///     <li>@c kFIRParameterLevel (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterCharacter (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventLevelUp = AnalyticsEventLevelUp

/// Login event. Apps with a login feature can report this event to signify that a user has logged
/// in.
public let MobvenUpdatesAnalyticsEventLogin = AnalyticsEventLogin

/// Post Score event. Log this event when the user posts a score in your gaming app. This event can
/// help you understand how users are actually performing in your game and it can help you correlate
/// high scores with certain audiences or behaviors. Params:
///
/// <ul>
///     <li>@c kFIRParameterScore (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterLevel (signed 64-bit integer as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCharacter (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventPostScore = AnalyticsEventPostScore

/// Present Offer event. This event signifies that the app has presented a purchase offer to a user.
/// Add this event to a funnel with the kFIREventAddToCart and kFIREventEcommercePurchase to gauge
/// your conversion process. Note: If you supply the @c kFIRParameterValue parameter, you must
/// also supply the @c kFIRParameterCurrency parameter so that revenue metrics can be computed
/// accurately. Params:
///
/// <ul>
///     <li>@c kFIRParameterQuantity (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
///     <li>@c kFIRParameterItemLocationID (NSString) (optional)</li>
///     <li>@c kFIRParameterPrice (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventPresentOffer = AnalyticsEventPresentOffer

/// E-Commerce Purchase Refund event. This event signifies that an item purchase was refunded.
/// Note: If you supply the @c kFIRParameterValue parameter, you must also supply the
/// @c kFIRParameterCurrency parameter so that revenue metrics can be computed accurately.
/// Params:
///
/// <ul>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterTransactionID (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventPurchaseRefund = AnalyticsEventPurchaseRefund

/// Remove from cart event. Params:
///
/// <ul>
///     <li>@c kFIRParameterQuantity (signed 64-bit integer as NSNumber)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
///     <li>@c kFIRParameterItemLocationID (NSString) (optional)</li>
///     <li>@c kFIRParameterPrice (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventRemoveFromCart = AnalyticsEventRemoveFromCart

/// Search event. Apps that support search features can use this event to contextualize search
/// operations by supplying the appropriate, corresponding parameters. This event can help you
/// identify the most popular content in your app. Params:
///
/// <ul>
///     <li>@c kFIRParameterSearchTerm (NSString)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
///     <li>@c kFIRParameterNumberOfNights (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfRooms (signed 64-bit integer as NSNumber) (optional) for
///         hotel bookings</li>
///     <li>@c kFIRParameterNumberOfPassengers (signed 64-bit integer as NSNumber) (optional)
///         for travel bookings</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterTravelClass (NSString) (optional) for travel bookings</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventSearch = AnalyticsEventSearch

/// Select Content event. This general purpose event signifies that a user has selected some content
/// of a certain type in an app. The content can be any object in your app. This event can help you
/// identify popular content and categories of content in your app. Params:
///
/// <ul>
///     <li>@c kFIRParameterContentType (NSString)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventSelectContent = AnalyticsEventSelectContent

/// Set checkout option. Params:
///
/// <ul>
///    <li>@c kFIRParameterCheckoutStep (unsigned 64-bit integer as NSNumber)</li>
///    <li>@c kFIRParameterCheckoutOption (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventSetCheckoutOption = AnalyticsEventSetCheckoutOption

/// Share event. Apps with social features can log the Share event to identify the most viral
/// content. Params:
///
/// <ul>
///     <li>@c kFIRParameterContentType (NSString)</li>
///     <li>@c kFIRParameterItemID (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventShare = AnalyticsEventShare

/// Sign Up event. This event indicates that a user has signed up for an account in your app. The
/// parameter signifies the method by which the user signed up. Use this event to understand the
/// different behaviors between logged in and logged out users. Params:
///
/// <ul>
///     <li>@c kFIRParameterSignUpMethod (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventSignUp = AnalyticsEventSignUp

/// Spend Virtual Currency event. This event tracks the sale of virtual goods in your app and can
/// help you identify which virtual goods are the most popular objects of purchase. Params:
///
/// <ul>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterVirtualCurrencyName (NSString)</li>
///     <li>@c kFIRParameterValue (signed 64-bit integer or double as NSNumber)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventSpendVirtualCurrency = AnalyticsEventSpendVirtualCurrency

/// Tutorial Begin event. This event signifies the start of the on-boarding process in your app. Use
/// this in a funnel with kFIREventTutorialComplete to understand how many users complete this
/// process and move on to the full app experience.
public let MobvenUpdatesAnalyticsEventTutorialBegin = AnalyticsEventTutorialBegin

/// Tutorial End event. Use this event to signify the user's completion of your app's on-boarding
/// process. Add this to a funnel with kFIREventTutorialBegin to gauge the completion rate of your
/// on-boarding process.
public let MobvenUpdatesAnalyticsEventTutorialComplete = AnalyticsEventTutorialComplete

/// Unlock Achievement event. Log this event when the user has unlocked an achievement in your
/// game. Since achievements generally represent the breadth of a gaming experience, this event can
/// help you understand how many users are experiencing all that your game has to offer. Params:
///
/// <ul>
///     <li>@c kFIRParameterAchievementID (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventUnlockAchievement = AnalyticsEventUnlockAchievement

/// View Item event. This event signifies that some content was shown to the user. This content may
/// be a product, a webpage or just a simple image or text. Use the appropriate parameters to
/// contextualize the event. Use this event to discover the most popular items viewed in your app.
/// Note: If you supply the @c kFIRParameterValue parameter, you must also supply the
/// @c kFIRParameterCurrency parameter so that revenue metrics can be computed accurately.
/// Params:
///
/// <ul>
///     <li>@c kFIRParameterItemID (NSString)</li>
///     <li>@c kFIRParameterItemName (NSString)</li>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
///     <li>@c kFIRParameterItemLocationID (NSString) (optional)</li>
///     <li>@c kFIRParameterPrice (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterQuantity (signed 64-bit integer as NSNumber) (optional)</li>
///     <li>@c kFIRParameterCurrency (NSString) (optional)</li>
///     <li>@c kFIRParameterValue (double as NSNumber) (optional)</li>
///     <li>@c kFIRParameterStartDate (NSString) (optional)</li>
///     <li>@c kFIRParameterEndDate (NSString) (optional)</li>
///     <li>@c kFIRParameterFlightNumber (NSString) (optional) for travel bookings</li>
///     <li>@c kFIRParameterNumberOfPassengers (signed 64-bit integer as NSNumber) (optional)
///         for travel bookings</li>
///     <li>@c kFIRParameterNumberOfNights (signed 64-bit integer as NSNumber) (optional) for
///         travel bookings</li>
///     <li>@c kFIRParameterNumberOfRooms (signed 64-bit integer as NSNumber) (optional) for
///         travel bookings</li>
///     <li>@c kFIRParameterOrigin (NSString) (optional)</li>
///     <li>@c kFIRParameterDestination (NSString) (optional)</li>
///     <li>@c kFIRParameterSearchTerm (NSString) (optional) for travel bookings</li>
///     <li>@c kFIRParameterTravelClass (NSString) (optional) for travel bookings</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventViewItem = AnalyticsEventViewItem

/// View Item List event. Log this event when the user has been presented with a list of items of a
/// certain category. Params:
///
/// <ul>
///     <li>@c kFIRParameterItemCategory (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventViewItemList = AnalyticsEventViewItemList

/// View Search Results event. Log this event when the user has been presented with the results of a
/// search. Params:
///
/// <ul>
///     <li>@c kFIRParameterSearchTerm (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventViewSearchResults = AnalyticsEventViewSearchResults

/// Level Start event. Log this event when the user starts a new level. Params:
///
/// <ul>
///     <li>@c kFIRParameterLevelName (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventLevelStart = AnalyticsEventLevelStart

/// Level End event. Log this event when the user finishes a level. Params:
///
/// <ul>
///     <li>@c kFIRParameterLevelName (NSString)</li>
///     <li>@c kFIRParameterSuccess (NSString)</li>
/// </ul>
public let MobvenUpdatesAnalyticsEventLevelEnd = AnalyticsEventLevelEnd

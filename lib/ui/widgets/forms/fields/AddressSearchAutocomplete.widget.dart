import 'dart:async';

import 'package:careyaya/models/address.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as places;
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyDS8X0xoKfDxyqAi8lfPP-8mxq7M3Ke3sg";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class AddressSearchAutocompleteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FormBuilderField(
        name: 'address',
        builder: (FormFieldState<dynamic> field) {
          return TextField(
            decoration: InputDecoration(
              hintText: 'Address',
              filled: true,
            ),
            onTap: () async {
              // show input autocomplete with selected mode
              // then get the Prediction selected
              Prediction p = await places.PlacesAutocomplete.show(
                context: context,
                apiKey: kGoogleApiKey,
                mode: places.Mode.overlay,
              );
              selectPrediction(p, field);
            },
          );
        },
      ),
    );
  }
}

Future<void> selectPrediction(
    Prediction p, FormFieldState<dynamic> field) async {
  if (p != null) {
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

    final description = detail.result.formattedAddress;
    final city = detail.result.addressComponents
        .firstWhere((addrComp) => addrComp.types.contains('locality'))
        .longName;
    final line1 = description.split(',')[0];
    final state = detail.result.addressComponents
        .firstWhere((addrComp) =>
            addrComp.types.contains('administrative_area_level_1'))
        .longName;
    final zip = detail.result.addressComponents
        .firstWhere((addrComp) => addrComp.types.contains('postal_code'))
        .longName;
    final placeId = p.placeId;
    final latitude = detail.result.geometry.location.lat;
    final longitude = detail.result.geometry.location.lng;

    final Address address = Address(
      description: description,
      state: state,
      longitude: longitude,
      latitude: latitude,
      city: city,
      line1: line1,
      placeId: placeId,
      zip: zip,
    );
    final jsonAddress = address.toJson();
    field.didChange(jsonAddress);
  }
}

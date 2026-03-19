import 'package:flutter/material.dart';
import 'package:wize_cards/data/models/deck_model.dart';

IconData deckIconByTags(DeckModel deck) {
  final tags = deck.tags.map((tag) => tag.trim().toLowerCase()).toSet();

  if (_hasAny(tags, _languageTags)) {
    return Icons.translate;
  }

  if (_hasAny(tags, _businessTags)) {
    return Icons.business_center_outlined;
  }

  if (_hasAny(tags, _techTags)) {
    return Icons.code;
  }

  if (_hasAny(tags, _complianceTags)) {
    return Icons.verified_user_outlined;
  }

  if (_hasAny(tags, _cultureAndPeopleTags)) {
    return Icons.groups_outlined;
  }

  return Icons.folder_outlined;
}

bool _hasAny(Set<String> source, Set<String> targets) {
  return source.any(targets.contains);
}

const Set<String> _languageTags = {
  'english',
  'español',
  'espanol',
  'spanish',
  'japanese',
  'french',
  'german',
  'language',
  'idioma',
};

const Set<String> _businessTags = {
  'business',
  'negotiation',
  'meeting',
  'soft-skills',
  'softskills',
};

const Set<String> _techTags = {
  'tech',
  'dev',
  'developer',
  'mobile',
  'flutter',
  'dart',
  'code',
};

const Set<String> _complianceTags = {
  'compliance',
  'security',
  'policy',
  'legal',
  'privacy',
};

const Set<String> _cultureAndPeopleTags = {
  'culture',
  'hr',
  'people',
  'onboarding',
  'team',
};

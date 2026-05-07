import re


def score_github_asset(assets, os_tokens, arch_tokens, ext_tokens,
                        os_weight=10, arch_weight=10, ext_weight=5):
    scores = []
    for asset in assets:
        name = asset.get('name', '')
        score = 0

        for token in os_tokens:
            if re.search(token, name, re.IGNORECASE):
                score += os_weight
        for token in arch_tokens:
            if re.search(token, name, re.IGNORECASE):
                score += arch_weight
        for token in ext_tokens:
            if re.search(token + r'$', name, re.IGNORECASE):
                score += ext_weight

        scores.append((score, asset))

    if not scores:
        return None

    scores.sort(key=lambda x: (-x[0], x[1].get('name', '')))
    return scores[0][1]


class FilterModule(object):
    def filters(self):
        return {'score_github_asset': score_github_asset}

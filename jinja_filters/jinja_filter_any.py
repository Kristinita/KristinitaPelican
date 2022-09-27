"""Any filter for Jinja."""


def jinja_filter_any(content, kira_markup_fragments_list):
    """[INFO] “if any() in object” Jinja filter:
    https://stackoverflow.com/a/73671899/5951529

        {content} — content of article or page in HTML markup
        {kira_markup_fragments_list} — list of HTML markup fragments for check
        {kira_markup_fragment} — specific HTML markup fragment for check
    """
    return any(f'{kira_markup_fragment}' in content for kira_markup_fragment in kira_markup_fragments_list)

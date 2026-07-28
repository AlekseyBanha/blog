@extends('layout')

@section('content')
    <div class="heading-page header-text">
        <section class="page-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-content">
                            <h4>{{ $doc['longtitle'] ?: 'Page' }}</h4>
                            <h2>{{ $doc['pagetitle'] }}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    {!! $doc['content'] !!}
@endsection
